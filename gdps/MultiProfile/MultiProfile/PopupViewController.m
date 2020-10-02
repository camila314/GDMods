//
//  PopupViewController.m
//  MultiProfile
//
//  Created by Full Name on 9/21/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "PopupViewController.h"
#import "NSString+MDHash.h"
#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(loadUrl:)
    name:@"FromUrl"
    object:nil];
    [super viewDidLoad];
    // Do view setup here.
}

- (void)loadUrl:(NSNotification*)anot {
    NSDictionary* info = [anot userInfo];
    NSLog(@"url got from notification: %@", info[@"url"]);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"FromUrl" object:nil];
    
    self.urlField.stringValue = info[@"url"];
}

- (void)viewDidAppear {
    NSButton *closeButton = [self.view.window standardWindowButton:NSWindowCloseButton];

    closeButton.hidden = YES;
    [self.view.window setStyleMask:NSWindowStyleMaskBorderless];
    [self.view.window setOpaque:NO];
    [self.view.window setBackgroundColor:[NSColor clearColor]];
}

- (void)nameError {
// not done yet
}
- (void)urlError {
// not done yet
}
- (IBAction)closePopup:(id)sender {
    NSAppDelegate.rootVC.hasModal = NO;
    [self.view.window close];
}
- (IBAction)addProfile:(id)sender {
    NSURL* url;
    NSString* urlString = self.urlField.stringValue;
    NSString* nameString = self.nameField.stringValue;
    if ([urlString hasPrefix:@"http://"] || [urlString hasPrefix:@"https://"]) {
        url = [NSURL URLWithString:urlString];
    } else {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", urlString]];
    }
    
    // parse url
    if (url.host==nil) {
        [self urlError];
        return;
    }
    
    // parse name
    NSCharacterSet *s = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_ "];
    s = [s invertedSet];
        
    NSRange r = [nameString rangeOfCharacterFromSet:s];
    
    for(ProfileViewController* i in NSAppDelegate.rootVC.profiles) {
        if([nameString isEqualToString:i.profileName]) {
            [self nameError];
            return;
        }
    }
    
    if (r.location != NSNotFound || nameString.length==0) {
        [self nameError];
        return;
    }
        
    // generate file name
    NSString* outSecond = [NSString stringWithFormat:@"%@%@", url.host, url.path];
        
    NSString* path = [NSString stringWithFormat:@"%@+%@.dat", nameString, outSecond.stringByEncodingHex];
    NSLog(@"%@", path);
    
    NSString *getPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Application Support/GeometryDash/GDProfiles"];
    
    NSString* destPath = [getPath stringByAppendingPathComponent:path];
    
    NSString* srcPath = [[NSBundle mainBundle] pathForResource:@"CCGameManager" ofType:@"dat"];
    
   // NSLog(@"%@", destPath);
    
    NSError* error;
    [[NSFileManager defaultManager] copyItemAtURL:[NSURL fileURLWithPath:srcPath] toURL:[NSURL fileURLWithPath:destPath] error:&error];
    
    [NSAppDelegate.rootVC addProfileWithFile:path];
    NSLog(@"%@", error.localizedDescription);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSAppDelegate.rootVC.hasModal = NO;
    [self.view.window close];
}

@end
