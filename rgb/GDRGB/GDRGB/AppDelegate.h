//
//  AppDelegate.h
//  GDRGB
//
//  Created by Full Name on 10/1/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property NSMutableDictionary* palettes;
@end

#define NSAppDelegate ((AppDelegate*)NSApp.delegate)
