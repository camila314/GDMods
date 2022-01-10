#include <Cacao.hpp>
#include <iostream>
#include <OpenGL/OpenGL.h>
#include<time.h>

using namespace cocos2d;

ModContainer* m;

#define NOPFUNC(adr) m->registerHook(getBase()+(adr), +[](){return;})

//#include "pog.h"


void inject() {
    m = new ModContainer("Swag");

    m->registerHook(getBase()+0x220a30, +[](PlayerObject* self, bool arg1){ // PlayerObject::hitGround
        self->_yAccel() = 0.0;
        self->_isSliding() = true;
        self->_onGround() = true;
    });

    NOPFUNC(0x6fb90) // PlayLayer::updateVisibility
    NOPFUNC(0x6e2b0); // PlayLayer::updateCamera
    NOPFUNC(0x225930); // PlayerObject::playDeathEffect
    NOPFUNC(0x21c570); // PlayerObject::runRotateAction
    NOPFUNC(0x123ee0); // PlayerObject::fadeOutStreak2
    NOPFUNC(0x3623d0); // GameSoundManager::playEffect

    Cacao::scheduleFunction(+[]() {
        auto lv = GJGameLevel::create();
        lv->_levelString() = "kS38,1_40_2_125_3_255_11_255_12_255_13_255_4_-1_6_1000_7_1_15_1_18_0_8_1|1_0_2_102_3_255_11_255_12_255_13_255_4_-1_6_1001_7_1_15_1_18_0_8_1|1_0_2_102_3_255_11_255_12_255_13_255_4_-1_6_1009_7_1_15_1_18_0_8_1|1_255_2_255_3_255_11_255_12_255_13_255_4_-1_6_1002_5_1_7_1_15_1_18_0_8_1|1_0_2_255_3_125_11_255_12_255_13_255_4_-1_6_1005_5_1_7_1_15_1_18_0_8_1|1_0_2_255_3_125_11_255_12_255_13_255_4_-1_6_1006_5_1_7_1_15_1_18_0_8_1|1_0_2_0_3_0_11_255_12_255_13_255_4_-1_6_3_7_1_15_1_18_0_8_1|,kA13,0,kA15,0,kA16,0,kA14,,kA6,1,kA7,0,kA17,0,kA18,0,kS39,0,kA2,0,kA3,0,kA8,0,kA4,0,kA9,0,kA10,0,kA11,0;1,1,2,200,3,30";
        auto pl = PlayLayer::create(lv);
        GameManager::sharedState()->_playLayer() = pl;

        pl->_gameStarted() = true;
        clock_t c1 = clock();
        constexpr int FPS = 60;
        for(int i=0; i<600*FPS;i++) {
            pl->PlayLayer::update(1./60.);
            if (pl->_player1()->_dead()) {
                pl->resetLevel();
            }
        }
        printf("took %f seconds for 10 minutes of gameplay\n", (clock()-c1)/((float)CLOCKS_PER_SEC));
    });

    m->enable();
}