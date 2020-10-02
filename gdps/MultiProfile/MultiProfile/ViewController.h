//
//  ViewController.h
//  gdmeditor
//
//  Created by Full Name on 6/12/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ProfileViewController.h"

@interface ViewController : NSViewController <NSTableViewDataSource,NSTableViewDelegate> {
    bool attached;
    float prevDeg;
}
@property (weak) IBOutlet NSStackView *stackView;

@property IBOutlet NSTextField* topLabel;
@property (weak) IBOutlet NSView *scrollView;
@property NSMutableArray* profiles;
@property (assign) BOOL hasModal;

- (void)rotateHueWithString:(NSString*)hash;
- (void)addProfileWithFile:(NSString*)name;
- (void)removeProfile:(ProfileViewController*)profile;
@end
