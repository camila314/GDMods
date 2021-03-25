#include <Cacao.hpp>
#include <iostream>

using namespace cocos2d;

class HInfoLayer;
ModContainer* m;

//#include "pog.h"

bool hSpawnInit(SetupSpawnPopup* self, EffectGameObject* ob, CCArray* arr) {
        self->initWithColor(ccc4(255,255,255,150));
        //CCLayer*& mainLayer = self->_mainLayer();
        //mainLayer = CCLayer::create();
        self->m_color = ccc3(255,255,255);
        self->_mainLayer() = CCLayer::create();
    //ORIG(hSpawnInit, 0x139950)(self, ob, arr);

    /*if (self->initWithColor(ccc4(0,0,0,150))) {

        self->registerWithTouchDispatcher();
        CCDirector::sharedDirector()->getTouchDispatcher()->incrementForcePrio(2);

        self->setTouchEnabled(true);
        self->setKeypadEnabled(true);

        CCLayer*& mainLayer = self->_mainLayer();
        mainLayer = CCLayer::create();
        self->addChild(mainLayer);
        auto scale9 = extension::CCScale9Sprite::create("GJ_square01.png");
        scale9->setContentSize(CCSizeMake(300, 280));
        scale9->setPosition(Cacao::relativePosition(50,50));

        mainLayer->addChild(scale9, -2);
        renderCustomUI(self, mainLayer);
    }*/
    return true;
}


void inject() {
    m = new ModContainer("Swag");

    m->registerHook(getBase()+0x139950, hSpawnInit);

    m->registerHook(getBase()+0x13bcf0, +[](SetupSpawnPopup* l) {
        l = reinterpret_cast<SetupSpawnPopup*>(reinterpret_cast<long>(l)-0x130);
        l->setKeypadEnabled(false);
        l->setTouchEnabled(false);
        l->removeFromParentAndCleanup(true);
    });

    m->enable();
}
