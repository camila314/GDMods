//
//  ViewController.h
//  GDRGB
//
//  Created by Full Name on 10/1/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSComboBoxDelegate, NSComboBoxDataSource>
@property (weak) IBOutlet NSColorWell *firstColor;
@property (weak) IBOutlet NSColorWell *secondColor;
@property (weak) IBOutlet NSComboBox *textField;
@property (weak) IBOutlet NSImageView *isAttached;
@property (weak) IBOutlet NSButton *setButton;

@end

