//
//  NSString+MDHash.m
//  MultiProfile
//
//  Created by Full Name on 9/19/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "NSString+MDHash.h"

#import <CommonCrypto/CommonDigest.h> // Need to import for CC_MD5 access

@implementation NSString (MDHash)
- (float)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), result ); // This is the md5 call
    
    
    NSString* strmd = [NSString stringWithFormat:
        @"%d%d%d%d",
        result[0], result[1], result[2], result[3],
        result[4]];
    
    //NSLog(strmd);
    return ([strmd longLongValue]%36000)/100.0;
}

-(NSString*)stringByEncodingHex {

    NSString * hexString = [NSString stringWithFormat:@"%@",
                           [NSData dataWithBytes:[self cStringUsingEncoding:NSUTF8StringEncoding]
                                          length:strlen([self cStringUsingEncoding:NSUTF8StringEncoding])]];

    for(NSString * toRemove in [NSArray arrayWithObjects:@"<", @">", @" ", nil]) {
        hexString = [hexString stringByReplacingOccurrencesOfString:toRemove withString:@""];
    }

    return hexString;
}

-(NSString*)stringByDecodingHex {
    NSMutableString * newString = [[NSMutableString alloc] init];
    int i = 0;
    while (i < [self length])
    {
        NSString * hexChar = [self substringWithRange: NSMakeRange(i, 2)];
        int value = 0;
        sscanf([hexChar cStringUsingEncoding:NSASCIIStringEncoding], "%x", &value);
        [newString appendFormat:@"%c", (char)value];
        i+=2;
    }
    
    return [NSString stringWithString:newString];
}
@end
