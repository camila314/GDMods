//
//  AppDelegate.m
//  GDRGB
//
//  Created by Full Name on 10/1/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.palettes = [[NSMutableDictionary alloc] init];
    
    //test
    self.palettes[@"Test"] = @[@0.5, @0.8, @0.3];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (void)savePalette {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.palettes
                                            options:(NSJSONWritingOptions)(0)
                                            error:nil];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    
    
}

@end
