// replace this code

#include <Cacao.hpp>
#include <iostream>
using namespace cocos2d;
ModContainer* m;

class CallbackHandler : public CCObject {
 public:
	void onRefresh(CCObject* sender) {
		auto eng = FMODAudioEngine::sharedEngine();
		eng->_backgroundVolume() = 0.0;
		eng->_sfxVolume() = 0.0;
	}
};

void hCustomSetup(CCLayer* self) {
	ORIG(hCustomSetup, 0x43dc70)(self);

	auto a = CCSprite::createWithSpriteFrameName("GJ_updateBtn_001.png");
	//a->setScale(2);
	auto mitem = CCMenuItemSpriteExtra::create(a, NULL, self, menu_selector(CallbackHandler::onRefresh));

	auto menu = CCMenu::create();
	menu->addChild(mitem);

	menu->setPosition(Cacao::addedPosition(-143.2,-74.4));
	self->addChild(menu);
}
void inject() {
	m = new ModContainer("Template code");

	m->registerHook(getBase()+0x43dc70, hCustomSetup);
	m->enable();
}