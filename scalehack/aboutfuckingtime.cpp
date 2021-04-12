#include <GDML/GDML.hpp>
#include <iostream>
#import <ApplicationServices/ApplicationServices.h>

ModContainer* m;

CGGammaValue table[] = {0, 1};

void lol(void* ok) {
	FCAST(lol, m->getOriginal(getBase()+0x225930))(ok);
	table[0] += 0.00001;
	table[1] -= 0.00001;
}

void inject() {
	m = new ModContainer("holy fucking shit scale hack im literally creaming my pants rn");
	MemoryContainer(getBase()+0x18D811, 1, "\xeb").enable();
	MemoryContainer(getBase()+0x18D7D9, 1, "\xeb").enable();

	m->registerHook(getBase()+0x225930, (func_t)lol);
	m->enable();
	for(;;)
    	CGSetDisplayTransferByTable(CGMainDisplayID(), sizeof(table) / sizeof(table[0]), table, table, table);
}