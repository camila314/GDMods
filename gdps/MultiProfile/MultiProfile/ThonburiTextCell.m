//
//  ThonburiTextCell.m
//  gdmeditor
//
//  Created by Full Name on 6/14/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "ThonburiTextCell.h"

@implementation ThonburiTextCell
- (NSRect) titleRectForBounds:(NSRect)frame {

CGFloat stringHeight = self.attributedStringValue.size.height;
NSRect titleRect = [super titleRectForBounds:frame];
CGFloat oldOriginY = frame.origin.y;
titleRect.origin.y = frame.origin.y + (frame.size.height - stringHeight) / 2.0;
titleRect.size.height = titleRect.size.height - (titleRect.origin.y - oldOriginY);
return titleRect;
}

- (void) drawInteriorWithFrame:(NSRect)cFrame inView:(NSView*)cView {
[super drawInteriorWithFrame:[self titleRectForBounds:cFrame] inView:cView];
}
- (NSFont*) font {
    return [NSFont fontWithName:@"Thonburi" size:15];
}
@end
