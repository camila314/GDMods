//
//  ProfileViewController.m
//  MultiProfile
//
//  Created by Full Name on 9/20/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "ProfileViewController.h"
#import <CoreImage/CoreImage.h>
#import "AppDelegate.h"
#import "NSString+MDHash.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (instancetype)initWithTitle:(NSString*)title {
    self.inUse = NO;
    globHue = 0.0;
    
    self = [super initWithNibName:@"ProfileViewController" bundle:nil];
    
    NSArray* parts = [title.stringByDeletingPathExtension componentsSeparatedByString:@"+"];
    
    if([title isEqualToString:@"CCGameManager.dat"]) {
        self.profileName = @"Default";
        self.profileUrl = @"www.boomlings.com/database";
        self.inUse = YES;
    } else if(parts.count==2) {
    self.profileName = parts[0];
    self.profileUrl = [parts[1] stringByDecodingHex];
    } else {
        NSLog(@"sorry what, %@", title);
    }
    self.profileFile = title;
    return self;
}
-(void) rotateImageView:(NSButton*)source withName:(NSString*)name byHue:(CGFloat)deltaHueRadians;
{
    //NSLog(@"image name (old) is %@", source.image.name);
    //NSString* name = [NSString stringWithString:source.image.name];
    //NSLog(@"image name (new) is %@",name);
    source.image = [NSImage imageNamed:name];
    
    //[source.image setName:nil];
    // Create a Core Image version of the image.
    CIImage *sourceCore = [CIImage imageWithCGImage:[source.image CGImageForProposedRect:nil context:nil hints:nil]];

    // Apply a CIHueAdjust filter
    CIFilter *hueAdjust = [CIFilter filterWithName:@"CIHueAdjust"];
    [hueAdjust setDefaults];
    [hueAdjust setValue: sourceCore forKey: @"inputImage"];
    [hueAdjust setValue: [NSNumber numberWithFloat: deltaHueRadians] forKey: @"inputAngle"];
    CIImage *resultCore = [hueAdjust valueForKey: @"outputImage"];

    // Convert the filter output back into a UIImage.
    // This section from http://stackoverflow.com/a/7797578/1318452
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef resultRef = [context createCGImage:resultCore fromRect:[resultCore extent]];
    NSImage *result = [[NSImage alloc] initWithCGImage:resultRef size:source.image.size];
    
    CGImageRelease(resultRef);

    
    source.image = result;
    //[source.image setName:name];
    
    //NSLog(@"finished processing image. did it work? %@. final name is %@", worked ? @"Yes" : @"No", source.image.name);
}


-(void)shiftHue:(CGFloat)hue {
    NSLog(@"doing a row, hue is %f", hue);
    globHue = hue;
    [self rotateImageView:self.trashButton withName:@"x" byHue:hue];
    
    if(self.inUse) {
        [self rotateImageView:self.useButton withName:@"inuse" byHue:hue];
    } else {
        [self rotateImageView:self.useButton withName:@"use" byHue:hue];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSLog(@"controller loaded");
    // Do view setup here.

    self.profileField.stringValue = self.profileName;
    
    self.seperatorView.wantsLayer = YES;
    [self.seperatorView.layer setBackgroundColor:[[NSColor colorWithRed:97/255. green:56/255. blue:31/255. alpha:1.0] CGColor]];

    [self shiftHue:0];
    
    if([self.profileName isEqualToString:@"Default"]) {
        self.trashButton.enabled = NO;
    }
}

- (void)stopUsing {
    self.inUse = NO;
    [self shiftHue:globHue];
    
}
- (IBAction)onUse:(id)sender {
    if(!self.inUse) {
        for(ProfileViewController* i in NSAppDelegate.rootVC.profiles) {
            [i stopUsing];
        }
        self.inUse = YES;
        [NSAppDelegate.rootVC rotateHueWithString:self.profileName];
        
        [NSAppDelegate sendIPCMessage:[NSString stringWithFormat:@"%@:%@", self.profileFile, self.profileUrl] withType:7];
    }
}
- (IBAction)onDelete:(id)sender {
    [self stopUsing];
    [NSAppDelegate.rootVC performSegueWithIdentifier:@"DeleteProfile" sender:self];
}

-(void)actuallyDelete {
    [NSAppDelegate.rootVC removeProfile:self];
    
    NSString *rootPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Application Support/GeometryDash/GDProfiles"];
    
    NSString* destPath = [rootPath stringByAppendingPathComponent:self.profileFile];
    
    NSFileManager* man = [NSFileManager defaultManager];
    if([man fileExistsAtPath:destPath]) {
        [man removeItemAtPath:destPath error:nil];
    } else {
        @throw [[NSException alloc] initWithName:@"FileNotExistException" reason:@"idk if you deleted some files or something but like thats not good" userInfo:nil];
    }
}
@end
