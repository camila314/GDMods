#include <GDML/GDML.hpp>
#include <Cocoa/Cocoa.h>
#include <unistd.h>
extern "C" {
long base;

ModContainer* fc;

double interval;

func_t fpsOrig;

extern void fpsSetup();

void setInterval(double intr) {
	FCAST(setInterval, fc->getOriginal(getBase()+0x1a3ee0))(interval);
}

void reset() {
	NSWindow* win = [[NSApp windows] firstObject];

	[win miniaturize:nil];
	[win deminiaturize:nil];
}



void fpsCallback() {
	NSLog(@"you clicked button lmao");
    dispatch_async(dispatch_get_main_queue(), ^(void){
        NSAlert *alert = [NSAlert alertWithMessageText: @"Set FPS"
                                         defaultButton:@"OK"
                                       alternateButton:@"Cancel"
                                           otherButton:nil
                             informativeTextWithFormat:@""];

        NSTextField *input = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 200, 24)];
        [input setStringValue:@"60.0"];
        [input autorelease];
        [alert setAccessoryView:input];
        NSInteger button = [alert runModal];
        if (button == NSAlertDefaultReturn) {
            [input validateEditing];
            interval = 1.0/[input doubleValue];
            reset();
        }
    });
}

}
void inject() {
	base = getBase();

	fc = new ModContainer("Fps Bypass", "global");

	fc->registerHook(getBase()+0x1a3ee0, (func_t)setInterval);
	fc->registerHook(getBase()+0x442dfc, (func_t)fpsSetup);

	fpsOrig = fc->getOriginal(getBase()+0x442dfc);

	fc->enable();


}