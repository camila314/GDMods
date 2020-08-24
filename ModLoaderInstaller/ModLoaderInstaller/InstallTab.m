//
//  InstallTab.m
//  ModLoaderInstaller
//
//  Created by Full Name on 5/30/20.
//  Copyright © 2020 Camden314. All rights reserved.
//

#import "InstallTab.h"

@interface InstallTab ()

@end

@implementation InstallTab

static NSString* p_th;
+ (NSString*) gdPath
{ @synchronized(self) { return p_th; } }
+ (void) setGdPath:(NSString*)pth
{ @synchronized(self) { p_th = pth; } }

- (void)viewDidLoad {
    self.tabControl = (BasedController*)self.parentViewController;
    self.fileManager = [NSFileManager defaultManager];
    switch(self.tabControl.selectedTabViewItemIndex) {
        case T_SEARCH:
            [self.searchProgress startAnimation:self];
            [NSTimer scheduledTimerWithTimeInterval:2.0f
              target:self
            selector: @selector(search)
            userInfo:nil
             repeats:NO];
            //[self search];
        case T_INJECT:
            [self.injectProgress startAnimation:self];
            [NSTimer scheduledTimerWithTimeInterval:2.0f
              target:self
            selector: @selector(inject)
            userInfo:nil
             repeats:NO];
            
    }
    [super viewDidLoad];
    // Do view setup here.
}
- (void)search {
    
    NSString* defaultPath = [NSString stringWithFormat:
                             @"/Users/%@/Library/Application Support/Steam/steamapps/common/Geometry Dash/Geometry Dash.app",
                             NSUserName()
                             ];
    BOOL exists = [self.fileManager fileExistsAtPath:defaultPath];
    [self.searchProgress stopAnimation:self];
    if(!exists) {
        self.tabControl.selectedTabViewItemIndex = T_SELECT;
    } else {
        InstallTab.gdPath = defaultPath;
        self.tabControl.selectedTabViewItemIndex = T_INJECT;
    }
    
}

- (void)inject {
    NSString* fmod_src = [[NSBundle mainBundle] pathForResource:@"libfmod" ofType:@"dylib"];
    NSString* inj_src = [[NSBundle mainBundle] pathForResource:@"d" ofType:@"dylib"];
    
    NSString* fmod_dest = [NSString stringWithFormat:@"%@/Contents/Frameworks/libfmod.dylib",InstallTab.gdPath];
    NSString* inj_dest = [NSString stringWithFormat:@"%@/Contents/Frameworks/d.dylib",InstallTab.gdPath];
    
    NSError* error1;
    NSError* error2;
    if([self.fileManager fileExistsAtPath:fmod_dest]) {
        [self.fileManager removeItemAtPath:fmod_dest error:nil];
        [self.fileManager removeItemAtPath:inj_dest error:nil];
        
        [self.fileManager copyItemAtURL:[NSURL fileURLWithPath:fmod_src] toURL:[NSURL fileURLWithPath:fmod_dest] error:&error1];
        [self.fileManager copyItemAtURL:[NSURL fileURLWithPath:inj_src] toURL:[NSURL fileURLWithPath:inj_dest] error:&error2];
        if(error1 || error2) {
            NSLog(@"Error occured. NSError codes: %@ and/or %@",error1.code,error2.code);
            self.tabControl.selectedTabViewItemIndex = T_ERROR;
        } else {
            self.tabControl.selectedTabViewItemIndex = T_SUCCESS;
        }
    } else {
        NSLog(@"the fuck m8: %@",fmod_dest);
        self.tabControl.selectedTabViewItemIndex = T_ERROR;
    }
}
- (IBAction)startSetup:(id)sender {
    self.tabControl.selectedTabViewItemIndex = T_CHOOSE;
}
- (IBAction)chooseDefault:(id)sender {
    self.tabControl.selectedTabViewItemIndex = T_SEARCH;
}
- (IBAction)chooseCustom:(id)sender {
    self.tabControl.selectedTabViewItemIndex = T_SELECT;
}
- (IBAction)selectGD:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:NO];
    [openDlg setAllowedFileTypes:@[@"app"]];
    
    if ([openDlg runModal] == NSModalResponseOK) {
        self.selectPath.stringValue = [[openDlg URL] path];
    }
}

- (IBAction)validateSelection:(id)sender {
    if([self.fileManager fileExistsAtPath:self.selectPath.stringValue]) {
        InstallTab.gdPath = self.selectPath.stringValue;
        self.tabControl.selectedTabViewItemIndex = T_INJECT;
    }
}
@end
