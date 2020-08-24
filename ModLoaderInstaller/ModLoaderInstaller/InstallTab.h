//
//  InstallTab.h
//  ModLoaderInstaller
//
//  Created by Full Name on 5/30/20.
//  Copyright © 2020 Camden314. All rights reserved.
//

#define T_START 0
#define T_CHOOSE 1
#define T_SEARCH 2
#define T_SELECT 3
#define T_INJECT 4
#define T_SUCCESS 5
#define T_ERROR 6
#import <Cocoa/Cocoa.h>
#import "BasedController.h"
NS_ASSUME_NONNULL_BEGIN

@interface InstallTab : NSViewController
@property (weak) BasedController* tabControl;
@property (weak) NSFileManager* fileManager;
@property (weak) IBOutlet NSProgressIndicator *searchProgress;
@property (weak) IBOutlet NSProgressIndicator *injectProgress;
@property (weak) IBOutlet NSTextField *selectPath;

+ (NSString*) gdPath;
+ (void) setGdPath:(NSString*)pth;
@end

NS_ASSUME_NONNULL_END
