//
//  NSString+NSString_strip.m
//  GDRGB
//
//  Created by Full Name on 10/5/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "NSString+NSString_strip.h"

#import <AppKit/AppKit.h>


@implementation NSString (NSString_strip)
-(NSString*)stringByStrippingWhitespace {
    // Remove leading and trailing whitespace
    NSString* targetString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
    // Split on the remaining whitespace to create an NSArray
    NSArray *components = [targetString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
    // Remove the blank string components with an NSPredicate
    components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF <> ''"]];
        
    // Join the components with a single space
    return [components componentsJoinedByString:@" "];
}
@end
