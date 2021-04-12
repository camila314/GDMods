// replace this code

#include <Cacao.hpp>
#include <iostream>

ModContainer* m;

void customCustomSetup(GameObject* self) {
	ORIG(customCustomSetup, 0x2fbba0)(self);
	if (self->_type() == 7) {
		self->_id() = 914;
		ORIG(customCustomSetup, 0x2fbba0)(self);
	}
}

void inject() {
	m = new ModContainer("Template code");

	m->registerHook(getBase()+0x2fbba0, customCustomSetup);
	m->enable();
	// ...
}