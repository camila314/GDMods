//
//  ClosingWindowController.m
//  GDURI
//
//  Created by Full Name on 9/7/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "ClosingWindowController.h"

@interface ClosingWindowController ()

@end

@implementation ClosingWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"%i",self.windowLoaded);
    [[self window] miniaturize:nil];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)loadWindow {
    return;
}
@end
