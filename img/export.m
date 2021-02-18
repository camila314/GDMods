#include <Cocoa/Cocoa.h>
#include <AVFoundation/AVFoundation.h>

@interface VideoWriter : NSObject
-(void)writeImageAsMovie:(NSArray *)array toPath:(NSString*)path size:(CGSize)size duration:(int)duration;
-(CVPixelBufferRef) pixelBufferFromCGImage: (CGImageRef) image imageSize: (CGSize)size;
@end

CGImageRef exportPng(void* data, int width, int height) {
	size_t bufferLength = width * height * 4;
	CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, data, bufferLength, NULL);
	size_t bitsPerComponent = 8;
	size_t bitsPerPixel = 32;
	size_t bytesPerRow = 4 * width;
	CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
	CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
	CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;

	CGImageRef iref = CGImageCreate(width, 
	                                height, 
	                                bitsPerComponent, 
	                                bitsPerPixel, 
	                                bytesPerRow, 
	                                colorSpaceRef, 
	                                bitmapInfo, 
	                                provider,   // data provider
	                                NULL,       // decode
	                                YES,        // should interpolate
	                                renderingIntent);
	return iref;
}

void writeToVideo(void* data[], int width, int height, char const* path, int length) {
	NSMutableArray* arr = [@[] mutableCopy];
	for (int i=0; i<length; i++) {
		[arr addObject:exportPng(data[i], width, height)];
	}
	VideoWriter* vr = [[VideoWriter alloc] init];
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		[vr writeImageAsMovie:arr toPath:[NSString stringWithUTF8String:path] size:CGSizeMake(width, height) duration:60*length];
	});
}

// AVVideoCodecTypeAppleProRes4444

@implementation VideoWriter : NSObject
-(void)writeImageAsMovie:(NSArray *)array toPath:(NSString*)path size:(CGSize)size duration:(int)duration
{

	[[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    NSError *error = nil;

    // FIRST, start up an AVAssetWriter instance to write your video
    // Give it a destination path (for us: tmp/temp.mov)
    AVAssetWriter *videoWriter = [[AVAssetWriter alloc] initWithURL:[NSURL fileURLWithPath:path]
                                                           fileType:AVFileTypeQuickTimeMovie
                                                              error:&error];


    NSParameterAssert(videoWriter);

    NSDictionary *videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                  AVVideoCodecTypeAppleProRes4444, AVVideoCodecKey,
                                   [NSNumber numberWithInt:size.width], AVVideoWidthKey,
                                   [NSNumber numberWithInt:size.height], AVVideoHeightKey,
                                  nil];

    AVAssetWriterInput* writerInput = [AVAssetWriterInput assetWriterInputWithMediaType:AVMediaTypeVideo
                                                                         outputSettings:videoSettings];

    AVAssetWriterInputPixelBufferAdaptor *adaptor = [AVAssetWriterInputPixelBufferAdaptor assetWriterInputPixelBufferAdaptorWithAssetWriterInput:writerInput
                                                                                                                     sourcePixelBufferAttributes:nil];
    NSParameterAssert(writerInput);
    NSParameterAssert([videoWriter canAddInput:writerInput]);
    [videoWriter addInput:writerInput];

    //Start a SESSION of writing. 
    // After you start a session, you will keep adding image frames 
    // until you are complete - then you will tell it you are done.
    [videoWriter startWriting];
    // This starts your video at time = 0
    [videoWriter startSessionAtSourceTime:kCMTimeZero];

    CVPixelBufferRef buffer = NULL;

    int i = 0;
    while (1)
    {
        // Check if the writer is ready for more data, if not, just wait
        if(writerInput.readyForMoreMediaData){

            CMTime frameTime = CMTimeMake(150, 600);
            // CMTime = Value and Timescale.
            // Timescale = the number of tics per second you want
            // Value is the number of tics
            // For us - each frame we add will be 1/4th of a second
            // Apple recommend 600 tics per second for video because it is a 
            // multiple of the standard video rates 24, 30, 60 fps etc.
            CMTime lastTime=CMTimeMake(i*10, 600);
            CMTime presentTime=CMTimeAdd(lastTime, frameTime);

            if (i == 0) {presentTime = CMTimeMake(0, 600);} 
            // This ensures the first frame starts at 0.


            if (i >= [array count])
            {
                buffer = NULL;
            }
            else
            {
                // This command grabs the next UIImage and converts it to a CGImage
                buffer = [self pixelBufferFromCGImage:[array objectAtIndex:i] imageSize:size];
            }


            if (buffer)
            {
                // Give the CGImage to the AVAssetWriter to add to your video
                [adaptor appendPixelBuffer:buffer withPresentationTime:presentTime];
                i++;
            }
            else
            {
                //Finish the session:
                // This is important to be done exactly in this order
                [writerInput markAsFinished];
                // WARNING: finishWriting in the solution above is deprecated. 
                // You now need to give a completion handler.
                [videoWriter finishWritingWithCompletionHandler:^{
                    NSLog(@"Finished writing...checking completion status...");
                    if (videoWriter.status != AVAssetWriterStatusFailed && videoWriter.status == AVAssetWriterStatusCompleted)
                    {
                        NSLog(@"Video writing succeeded.");
                    } else
                    {
                        NSLog(@"Video writing failed: %@", videoWriter.error);
                    }

                }]; // end videoWriter finishWriting Block

                CVPixelBufferPoolRelease(adaptor.pixelBufferPool);
                NSLog (@"Done");
                break;
            }
        }
    }    
}

-(CVPixelBufferRef) pixelBufferFromCGImage:(CGImageRef)image imageSize:(CGSize)frameSize
{
    int height = frameSize.height;
    int width = frameSize.width;

    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferRef pxbuffer = NULL;

    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault, width,
                                          height, kCVPixelFormatType_32ARGB, (__bridge CFDictionaryRef) options,
                                          &pxbuffer);

    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);

    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    NSParameterAssert(pxdata != NULL);

    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();

	CGContextRef context = CGBitmapContextCreate(pxdata,
	                                             width, height,
	                                             8, CVPixelBufferGetBytesPerRow(pxbuffer),
	                                             rgbColorSpace,
	                                             kCGImageAlphaNoneSkipFirst);//kCGImageAlphaPremultipliedLast);
    NSParameterAssert(context);
    CGContextConcatCTM(context, CGAffineTransformMakeRotation(0));
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(image),
                                           CGImageGetHeight(image)), image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);

    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);

    return pxbuffer;
}
@end