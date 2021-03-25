// replace this code

#include <Cacao.hpp>
#include <iostream>

using namespace cocos2d;

ModContainer* m;
CCLabelBMFont* sharedLabel;

void rotaInit(GJRotationControl* self) {
	ORIG(rotaInit, 0x31510)(self);
	sharedLabel = CCLabelBMFont::create("0", "bigFont.fnt");
	self->addChild(sharedLabel);
	sharedLabel->setPosition(CCPoint(0,40));
	sharedLabel->setScale(0.5);
}

void rotateChanged(GJRotationControl* self, CCPoint p) {
	ORIG(rotateChanged, 0x316a0)(self, p);
	sharedLabel->setString(CCString::createWithFormat("%d", (int)self->_rotation())->getCString());
}
void inject() {
	sharedLabel = nullptr;
	m = new ModContainer("GJRotationControl");
	m->registerHook(getBase()+0x31510, rotaInit);
	m->registerHook(getBase()+0x316a0, rotateChanged);
	m->enable();
	// ...
}