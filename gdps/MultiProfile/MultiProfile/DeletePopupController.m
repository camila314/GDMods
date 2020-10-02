//
//  DeletePopupController.m
//  MultiProfile
//
//  Created by Full Name on 9/23/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "DeletePopupController.h"
#import "AppDelegate.h"

@interface DeletePopupController ()

@end

@implementation DeletePopupController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)viewDidAppear {
    NSButton *closeButton = [self.view.window standardWindowButton:NSWindowCloseButton];

    closeButton.hidden = YES;
    [self.view.window setStyleMask:NSWindowStyleMaskBorderless];
    [self.view.window setOpaque:NO];
    [self.view.window setBackgroundColor:[NSColor clearColor]];
}

- (IBAction)closePopup:(id)sender {
    NSAppDelegate.rootVC.hasModal = NO;
    [self.view.window close];
}

- (void)addCon:(ProfileViewController*)sender {
    self.profileController = sender;
    NSLog(@"we might be deleting");
}
- (IBAction)weDeleting:(id)sender {
    if(!self.profileController) {
        @throw [[NSException alloc] initWithName:@"NoLongerExistsException" reason:@"somehow the profile we were trying to delete no longer exists????? report this to camden if you see this" userInfo:nil];
    }
    
    [self.profileController actuallyDelete];
    NSAppDelegate.rootVC.hasModal = NO;
    [self.view.window close];
}

@end
