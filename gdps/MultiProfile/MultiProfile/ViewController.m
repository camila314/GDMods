//
//  ViewController.m
//  gdmeditor
//
//  Created by Full Name on 6/12/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "ViewController.h"
#import "StupidPusabTextCell.h"
#import "AppDelegate.h"
#import <CoreImage/CoreImage.h>
#include <math.h>
#import "NSString+MDHash.h"

#import "ProfileView.h"
#import "DeletePopupController.h"

@implementation ViewController

-(void) rotateImageView:(NSImageView*)source byHue:(CGFloat)deltaHueRadians withName:(NSString*)name;
{
    source.image = [NSImage imageNamed:name];
    // Create a Core Image version of the image.
    CIImage *sourceCore = [CIImage imageWithCGImage:[source.image CGImageForProposedRect:nil context:nil hints:nil]];

    // Apply a CIHueAdjust filter
    CIFilter *hueAdjust = [CIFilter filterWithName:@"CIHueAdjust"];
    [hueAdjust setDefaults];
    [hueAdjust setValue: sourceCore forKey: @"inputImage"];
    [hueAdjust setValue: [NSNumber numberWithFloat: deltaHueRadians] forKey: @"inputAngle"];
    CIImage *resultCore = [hueAdjust valueForKey: @"outputImage"];

    // Convert the filter output back into a UIImage.
    // This section from http://stackoverflow.com/a/7797578/1318452
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef resultRef = [context createCGImage:resultCore fromRect:[resultCore extent]];
    NSImage *result = [[NSImage alloc] initWithCGImage:resultRef size:source.image.size];
    
    CGImageRelease(resultRef);

    
    source.image = result;
}

-(void)rotateColor:(id)any byHue:(CGFloat)hueRot {
    CGFloat hue = 0.0;
    CGFloat sat = 0.0;
    CGFloat bri = 0.0;
    CGFloat alp = 0.0;
    
    NSColor* cl;
    id cl2 = [any backgroundColor];
    
    BOOL isCG = NO;
    if([cl2 isKindOfClass:[NSColor class]]) {
        cl = (NSColor*)cl2;
    } else {
        isCG = YES;
        cl = [NSColor colorWithCGColor:(CGColorRef)cl2];
    }
    
    if(cl.colorSpace != NSColorSpace.sRGBColorSpace) {
        cl = [[any backgroundColor] colorUsingColorSpace:NSColorSpace.sRGBColorSpace];
    }
    
    [cl getHue:&hue saturation:&sat brightness:&bri alpha:&alp];
    
    hue += hueRot;
    
    hue = fmod(hue, 1.0);
    if(hue<0) {
        hue = 1+hue;
    }
    
    NSColor* col = [NSColor colorWithHue:hue
    saturation:sat
    brightness:bri
         alpha:alp];

    if(isCG) {
        [any setBackgroundColor:col.CGColor];
    } else {
    [any setBackgroundColor:col];
    }
    
}

-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
    id c = [segue destinationController];
    self.hasModal = YES;
    if([c isKindOfClass:[DeletePopupController class]]) {
        [(DeletePopupController*)c addCon:sender];
    }
}

- (AppDelegate*)sharedDel {
    return [[NSApplication sharedApplication] delegate];
}
- (void)rotateHueWithString:(NSString*)hash {
    CGFloat deltaHueDegrees = ([hash md5]-82.14);
    
    [self rotateImageView:self.view.subviews[0] byHue:deltaHueDegrees/(180/M_PI) withName:@"game"];
    [self rotateImageView:self.view.subviews[1] byHue:deltaHueDegrees/(180/M_PI) withName:@"add"];
    [self rotateImageView:self.view.subviews.lastObject byHue:deltaHueDegrees/(180/M_PI) withName:@"frame"];
    
    for(ProfileViewController* i in self.profiles) {
        [self rotateColor:i.seperatorView.layer byHue:(deltaHueDegrees-prevDeg)/360];
        [i shiftHue:(deltaHueDegrees)/(180/M_PI)];
    }
    [self rotateColor:self.scrollView byHue:(deltaHueDegrees-prevDeg)/360];
    prevDeg = deltaHueDegrees;
}

- (void)addProfileWithFile:(NSString*)name {
    ProfileViewController* t = [[ProfileViewController alloc] initWithTitle:name];
    t.view.translatesAutoresizingMaskIntoConstraints = NO;

    [self.profiles addObject:t];
    [self.stackView addArrangedSubview:t.view];
    [self.stackView layoutSubtreeIfNeeded];
    
    self.stackView.frame = CGRectMake(0, self.stackView.frame.origin.y-75.0, self.stackView.frame.size.width, self.stackView.frame.size.height + 75.0);
    
}

- (void)removeProfile:(ProfileViewController*)profile {
    [self.profiles removeObject:profile];
    [self.stackView removeArrangedSubview:profile.view];
    [self.stackView layoutSubtreeIfNeeded];
    self.stackView.frame = CGRectMake(0, self.stackView.frame.origin.y+75.0, self.stackView.frame.size.width, self.stackView.frame.size.height - 75.0);
    
}

- (void)preloadProfiles {
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *getPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Application Support/GeometryDash/GDProfiles"];
    
    NSError* error;
    [[NSFileManager defaultManager] createDirectoryAtPath:getPath
    withIntermediateDirectories:YES
                     attributes:nil
                          error:&error];
    NSLog(@"%@", error.localizedDescription);
    
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:getPath
                                                                        error:NULL];
    [dirs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *filename = (NSString *)obj;
        NSString *extension = [[filename pathExtension] lowercaseString];
        if ([extension isEqualToString:@"dat"]) {
            [self addProfileWithFile:filename];
        }
    }];
}

- (void)viewDidLoad {
    prevDeg = 0.0;
    attached = NO;
    self.profiles = [[NSMutableArray alloc] init];
    NSLog(@"gaming");
    // Do any additional setup after loading the view.
    
    [self addProfileWithFile:@"CCGameManager.dat"];
    
    [self preloadProfiles];
    
    //[self rotateHueWithString:@"Test4.dat"];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
