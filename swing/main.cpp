// replace this code

#include <Cacao.hpp>
#include <iostream>
#include <math.h>

ModContainer* m;

void updateJump(PlayerObject* self, float delta) {
	CCPointer<double> yAccel = self->_yAccel();
	if ((bool)self->_isShip()) {
		float sign = self->_isUpsideDown().get() ? -1.0 : 1.0;
		float gravity = 0.8214808;
		float size = self->_vSize().get()!=1.0 ? 0.85 : 1.0;
		float multiplier = -1.0;

		double starter = yAccel;

		bool doIFlip = false;

		if (self->_isHolding().get() && self->_hasJustHeld().get()) {
			self->_hasJustHeld() = false;
			doIFlip = true;
			//multiplier = 0.4;
		}

		starter += (gravity * delta * sign * 0.5 * multiplier)/size;
		yAccel = starter;

		if (doIFlip) {
			self->flipGravity(sign==1.0, true);
		}

	} else {
		FCAST(updateJump, m->getOriginal(getBase()+0x219680))(self, delta);
	}
}
void inject() {
	m = new ModContainer("Template code");

	long awhy = (long)m->registerHook(getBase()+0x219680, updateJump);
	m->enable();
	// ...
}