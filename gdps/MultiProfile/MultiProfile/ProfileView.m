//
//  ProfileView.m
//  MultiProfile
//
//  Created by Full Name on 9/20/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "ProfileView.h"

@implementation ProfileView

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    [[NSBundle mainBundle] loadNibNamed:@"ProfileView" owner:self topLevelObjects:nil];
    
    self.contentView.bounds = self.bounds;
    self.contentView.autoresizingMask = NSViewWidthSizable|NSViewHeightSizable;
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSLog(@"im trying ok? my height is %f", self.frame.size.height);
    [[NSColor redColor] set];
    //NSRectFill(dirtyRect);
    // Drawing code here.
}

- (NSSize)intrinsicContentSize {
    return NSMakeSize(497,100);
}
@end
