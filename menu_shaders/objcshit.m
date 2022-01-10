#import <Cocoa/Cocoa.h>

CGPoint getMouse() {
	return [[[NSApplication sharedApplication] mainWindow] mouseLocationOutsideOfEventStream];
}