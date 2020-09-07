//
//  AppDelegate.m
//  GDURI
//
//  Created by Full Name on 9/7/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [NSApp setActivationPolicy: NSApplicationActivationPolicyProhibited];
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)handleURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
    NSString *path = [[[event paramDescriptorForKeyword:keyDirectObject] stringValue] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    path = [path stringByReplacingOccurrencesOfString:@"gd://" withString:@""];
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    if([nf numberFromString:path] == nil) {
        NSLog(@"wtf");
        return;
    }
    
                             
    CFMessagePortRef tmpPort = CFMessagePortCreateRemote(0, CFSTR("314GDL"));
    
    if(tmpPort && CFMessagePortIsValid(tmpPort)) {
        CFDataRef toSend = CFDataCreate(NULL, (UInt8*)path.UTF8String, path.length+1);
        
        CFMessagePortSendRequest(tmpPort,
        0x6,
        toSend,
        1,
        0.1,
        NULL,
        NULL);
    } else {
        NSLog(@"wtf");
    }
    NSLog(@"heres the level id lmao %@",path);
}
@end
