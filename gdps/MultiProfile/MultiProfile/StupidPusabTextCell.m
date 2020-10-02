//
//  StupidPusabTextCell.m
//  gdmeditor
//
//  Created by Full Name on 6/12/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "StupidPusabTextCell.h"

@implementation StupidPusabTextCell
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

-(void)setStringValue:(NSString*)stringValue {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    NSDictionary* attributes = @{
        NSStrokeWidthAttributeName: @-3,
        NSForegroundColorAttributeName: [NSColor whiteColor],
        NSStrokeColorAttributeName: [NSColor blackColor],
        NSParagraphStyleAttributeName: paragraphStyle
    };
    NSAttributedString* str = [[NSAttributedString alloc] initWithString:stringValue attributes:attributes];
    self.attributedStringValue = str;
    
}
@end
