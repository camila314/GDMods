#include <GDML/GDML.hpp>
#include <Cocoa/Cocoa.h>
extern "C" {
long base;
extern void addBtn();
void (*pauseOriginal)();
float SPEED = 1.0;
ModContainer* container;
void setSpeed() {
    dispatch_async(dispatch_get_main_queue(), ^(void){
        NSAlert *alert = [NSAlert alertWithMessageText: @"Set Speed"
                                         defaultButton:@"OK"
                                       alternateButton:@"Cancel"
                                           otherButton:nil
                             informativeTextWithFormat:@""];

        NSTextField *input = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 200, 24)];
        [input setStringValue:@"1"];
        [input autorelease];
        [alert setAccessoryView:input];
        NSInteger button = [alert runModal];
        if (button == NSAlertDefaultReturn) {
            [input validateEditing];
            SPEED = [input floatValue];
        }
    });
}
}

void speedhack(void* instance) {
	FCAST(speedhack, container->getOriginal(getBase()+0x2497a0))(instance);
	float* m_fDeltaTime = (float*)((intptr_t)instance+0x90);
	*m_fDeltaTime = (*m_fDeltaTime)*SPEED;
}
void inject() {
	container = new ModContainer("Speedhack", "player");
	base = getBase();
	container->registerHook(getBase()+0x20b6b2, addBtn);
    container->registerHook(getBase()+0x2497a0, (func_t)speedhack);


	pauseOriginal = FCAST(addBtn, container->getOriginal(getBase()+0x20b6b2));

	container->enable();
}