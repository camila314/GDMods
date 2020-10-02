//
//  ProfileViewController.h
//  MultiProfile
//
//  Created by Full Name on 9/20/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : NSViewController {
    CGFloat globHue;
}
@property NSString* profileName;
@property NSString* profileUrl;
@property NSString* profileFile;
@property (assign) BOOL inUse;

@property IBOutlet NSView* seperatorView;
@property IBOutlet NSButton* trashButton;
@property IBOutlet NSButton* useButton;
@property IBOutlet NSTextField* profileField;

-(void)shiftHue:(CGFloat)hue;
-(instancetype)initWithTitle:(NSString*)title;
-(void)actuallyDelete;
- (void)stopUsing;
@end

NS_ASSUME_NONNULL_END
