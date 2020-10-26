//
//  ViewController.m
//  GDRGB
//
//  Created by Full Name on 10/1/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import "ViewController.h"
#import <CoreFoundation/CoreFoundation.h>
#import "AppDelegate.h"
#import "NSString+NSString_strip.h"

typedef struct col {
    unsigned char r;
    unsigned char g;
    unsigned char b;
} col;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self checkAttached:nil];

    self.firstColor.wantsLayer = YES;
    self.secondColor.wantsLayer = YES;
    
    self.firstColor.layer.cornerRadius = 22.5;
    self.firstColor.layer.masksToBounds = YES;
    self.firstColor.layer.borderWidth=9;
    self.firstColor.layer.borderColor = self.firstColor.color.CGColor;
    
    [self.firstColor addObserver:self forKeyPath:@"color" options:0 context:NULL];

    self.secondColor.layer.cornerRadius = 22.5;
    self.secondColor.layer.masksToBounds = YES;
    self.secondColor.layer.borderWidth=9;
    self.secondColor.layer.borderColor = self.secondColor.color.CGColor;

    [self.secondColor addObserver:self forKeyPath:@"color" options:0 context:NULL];
    // Do any additional setup after loading the view.
    
    self.textField.delegate = self;
    self.textField.dataSource = self;
    
    [NSTimer scheduledTimerWithTimeInterval:0.5f
    target:self selector:@selector(checkAttached:) userInfo:nil repeats:YES];
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(NSColorWell*)object change:(NSDictionary *)change context:(void *)context {
    object.layer.borderColor = object.color.CGColor;
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
NSLog(@"ended");
   [self.view.window makeFirstResponder:self.view];
}

-(NSInteger)numberOfItemsInComboBox:(NSComboBox *)comboBox {
    return NSAppDelegate.palettes.count;
}

- (id)comboBox:(NSComboBox *)comboBox objectValueForItemAtIndex:(NSInteger)index {
    return [NSAppDelegate.palettes.allKeys objectAtIndex:index];
}
- (IBAction)loadPalette:(id)sender {
    NSString* stripped = self.textField.stringValue.stringByStrippingWhitespace;
    if([NSAppDelegate.palettes.allKeys containsObject:stripped]) {
        NSArray<NSNumber*>* rgbs = NSAppDelegate.palettes[stripped];
        
        self.firstColor.color = [NSColor colorWithRed:rgbs[0].floatValue green:rgbs[1].floatValue blue:rgbs[2].floatValue alpha:1.0];
        self.secondColor.color = [NSColor colorWithRed:rgbs[3].floatValue green:rgbs[4].floatValue blue:rgbs[5].floatValue alpha:1.0];
    }
}
- (IBAction)savePalette:(id)sender {
    NSString* stripped = self.textField.stringValue.stringByStrippingWhitespace;
    NSLog(@"%@", stripped);
    
    const CGFloat* firstrgb = CGColorGetComponents(self.firstColor.color.CGColor);
    const CGFloat* secrgb = CGColorGetComponents(self.secondColor.color.CGColor);
    NSArray<NSNumber*>* rgbs = @[[NSNumber numberWithFloat:firstrgb[0]],
                                 [NSNumber numberWithFloat:firstrgb[1]],
                                 [NSNumber numberWithFloat:firstrgb[2]],
                                 [NSNumber numberWithFloat:secrgb[0]],
                                 [NSNumber numberWithFloat:secrgb[1]],
                                 [NSNumber numberWithFloat:secrgb[2]]
                                ];
    if(![stripped isEqualToString:@""])
        [NSAppDelegate.palettes setObject:rgbs forKey:stripped];
    [NSAppDelegate savePalettes];
}
- (IBAction)removePalette:(id)sender {
    NSString* stripped = self.textField.stringValue.stringByStrippingWhitespace;
    if([NSAppDelegate.palettes.allKeys containsObject:stripped]) {
        [NSAppDelegate.palettes removeObjectForKey:stripped];
        self.textField.stringValue = @"";
    }
    [NSAppDelegate savePalettes];
}

-(void)checkAttached:(NSTimer*)nothing {
    CFMessagePortRef port = CFMessagePortCreateRemote(NULL, CFSTR("gdRgb"));
    if(port && CFMessagePortIsValid(port)) {
        self.setButton.enabled = YES;
        self.isAttached.image = [NSImage imageNamed:@"yes"];
    } else {
        self.setButton.enabled = NO;
        self.isAttached.image = [NSImage imageNamed:@"no"];
    }
}
@end
