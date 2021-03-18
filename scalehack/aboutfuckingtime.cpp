#include <GDML/GDML.hpp>
#include <iostream>

ModContainer* m;

void inject() {
	m = new ModContainer("holy fucking shit scale hack im literally creaming my pants rn");
	MemoryContainer(getBase()+0x18D811, 1, "\xeb").enable();
	MemoryContainer(getBase()+0x18D7D9, 1, "\xeb").enable();
}