//
//  DeletePopupController.h
//  MultiProfile
//
//  Created by Full Name on 9/23/20.
//  Copyright © 2020 camden314. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ProfileViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface DeletePopupController : NSViewController
@property ProfileViewController* profileController;

- (void)addCon:(ProfileViewController*)sender;
@end

NS_ASSUME_NONNULL_END
