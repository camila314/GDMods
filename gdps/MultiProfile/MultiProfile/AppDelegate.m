//
//  AppDelegate.m
//  gdmeditor
//
//  Created by Full Name on 6/12/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"finished");
    self.rootVC = (ViewController*)[[NSApp windows][0] contentViewController];

    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)sendIPCMessage:(NSString*)msg withType:(int)type {
    CFMessagePortRef remotePort = CFMessagePortCreateRemote(0, CFSTR("314GDL"));
    
    CFDataRef toSend = CFDataCreate(NULL, (UInt8*)msg.UTF8String, msg.length+1);
    if(remotePort && CFMessagePortIsValid(remotePort)) {
        CFMessagePortSendRequest(remotePort,
                             type,
                             toSend,
                             1,
                             1,
                             NULL,
                             NULL);
    }
    
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
        return YES;
}

- (void)handleURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
    
    NSString *path = [[[event paramDescriptorForKeyword:keyDirectObject] stringValue] stringByRemovingPercentEncoding];
    path = [path stringByReplacingOccurrencesOfString:@"gdps://" withString:@""];

    [NSApp activateIgnoringOtherApps:YES];
    NSDictionary* info = @{@"url": path};
    
    if(self.rootVC.hasModal == NO) {
        [self.rootVC performSegueWithIdentifier:@"AddProfile" sender:self];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FromUrl" object:nil userInfo:info];
}
@end
