#include <GDML/GDML.hpp>
ModContainer* i;

void* speedup(void* a, float b) {
	float c = (float)b;

	if(c == (float)0.7)
		c = (float)-0.9;

	return FCAST(speedup, i->getOriginal(getBase()+0x2185E0))(a, c);
}

void inject() {
	i = new ModContainer("Slow speed reverse", "player");

	i->registerHook(getBase() + 0x2185E0,(func_t)speedup);

	i->enable();
}