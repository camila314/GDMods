//
//  AppDelegate.h
//  gdmeditor
//
//  Created by Full Name on 6/12/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewController.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>
@property ViewController* rootVC;
- (void)sendIPCMessage:(NSString*)msg withType:(int)type;
@end

#define NSAppDelegate ((AppDelegate*)[NSApp delegate])
