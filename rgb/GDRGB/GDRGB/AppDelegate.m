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

    [self loadPalettes];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (void)savePalettes {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.palettes
                                            options:(NSJSONWritingOptions)(0)
                                            error:nil];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *directory = [[paths firstObject] stringByAppendingPathComponent:@"RGD"];
    
    [fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:NULL];
    
    NSString* jsFile = [directory stringByAppendingPathComponent:@"palettes.json"];
    [jsonData writeToFile:jsFile atomically:YES];
}

- (void)loadPalettes {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *directory = [[paths firstObject] stringByAppendingPathComponent:@"RGD"];
    
    [fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:NULL];
    
    NSString* jsFile = [directory stringByAppendingPathComponent:@"palettes.json"];
    
    if([fileManager fileExistsAtPath:jsFile]) {
        NSData* jsonData = [NSData dataWithContentsOfFile:jsFile];
        [self.palettes removeAllObjects];
        NSDictionary* toCopy =  [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:kNilOptions
                                                          error:nil];
        [self.palettes addEntriesFromDictionary:toCopy];
    } else {
        [self savePalettes];
    }
    
}
@end
