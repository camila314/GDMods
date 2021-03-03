// Hot

#include <Cacao.hpp>
#include <iostream>

ModContainer* m;

void (*updateJumpOrig)(PlayerObject*, float);
void updateJump(PlayerObject* self, float delta) {
	updateJumpOrig(self, delta);
	if (self->_isShip().get() && self->_inPlayLayer().get()) {
		float camerapos = self->_yPos() - cocos2d::CCDirector::sharedDirector()->getWinSize().height/2;
		GameManager::sharedState()
			->_playLayer().get()
			->_cameraY() = camerapos;
	}
}
void inject() {
	m = new ModContainer("Template code");

	updateJumpOrig = m->registerHook(getBase()+0x219680, updateJump);
	m->registerWrite(getBase()+0x78EB9, 2, "\x90\x90");
	m->registerWrite(getBase()+0x78EC3, 2, "\x90\x90");
	m->registerWrite(getBase()+0x78ECD, 2, "\x90\x90");

	m->enable();
}