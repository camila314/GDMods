//
//  ViewController.m
//  GDRGB
//
//  Created by Full Name on 10/1/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "ViewController.h"
#import <CoreFoundation/CoreFoundation.h>

typedef struct col {
    unsigned char r;
    unsigned char g;
    unsigned char b;
} col;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)updateColors:(id)sender {
    NSColor* fcol = [self.firstColor color];
    const CGFloat* folf = CGColorGetComponents(fcol.CGColor);
    col firstC = {.r=folf[0]*255, .g=folf[1]*255, .b=folf[2]*255};
    
    NSColor* scol = [self.secondColor color];
    const CGFloat* solf = CGColorGetComponents(scol.CGColor);
    col secondC = {.r=solf[0]*255, .g=solf[1]*255, .b=solf[2]*255};
    
    CFMessagePortRef port = CFMessagePortCreateRemote(NULL, CFSTR("gdRgb"));

    NSLog(@"pog");
    if(port && CFMessagePortIsValid(port)) {
        CFDataRef toSend = CFDataCreate(NULL, (const void*)&firstC, sizeof(unsigned char)*3);
        
        CFMessagePortSendRequest(port,
                                 0x1,
                                 toSend,
                                 1,
                                 1,
                                 NULL,
                                 NULL);

        CFDataRef toSend2 = CFDataCreate(NULL, (const void*)&secondC, sizeof(unsigned char)*3);
        
        CFMessagePortSendRequest(port,
                                 0x2,
                                 toSend2,
                                 1,
                                 1,
                                 NULL,
                                 NULL);
    }
}

@end
