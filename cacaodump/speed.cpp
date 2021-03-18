#include <Cacao.hpp>
#include <iostream>

using namespace cocos2d;

ModContainer* m;
#include "cocoxib.h"
#define DREF(exp) (*((uint64_t*)(exp)))
class SetupSpeedPopup : public FLAlertLayer {
 public:
    SetupSpeedPopup() : 
        FLAlertLayer() {
            m_controlConnected = -1;
            m_joystickConnected = -1;
        }
    static SetupSpeedPopup* create(EffectGameObject* ego) {
        SetupSpeedPopup* ret = new SetupSpeedPopup();
        uint64_t ok1 = *((uint64_t*)ret);
        uint64_t ok2 = DREF(ok1-8)+16;

        uint64_t n_typinfo = getBase()+0x65d870;
        MemoryContainer(ok2, 8, reinterpret_cast<char*>(&n_typinfo)).enable();
        if (ret && ret->init(ego)) {
            ret->m_scene = NULL;
            ret->autorelease();
        } else {
            CC_SAFE_DELETE(ret);
        }
        //for(;;){}
        return ret;
    }
    bool init(EffectGameObject* ego) {
        this->initWithColor(ccc4(0,0,0,150));
        m_mainLayer = CCLayer::create();

        /*if (this->initWithColor(ccc4(0,0,0,150))) {
            this->registerWithTouchDispatcher();
            CCDirector::sharedDirector()->getTouchDispatcher()->incrementForcePrio(2);

            this->setTouchEnabled(true);
            this->setKeypadEnabled(true);

            m_mainLayer = CCLayer::create();
            this->addChild(m_mainLayer);

            auto scale9 = extension::CCScale9Sprite::create("GJ_square01.png");
            scale9->setContentSize(CCSizeMake(300, 280));
            scale9->setPosition(Cacao::relativePosition(50,50));
            m_mainLayer->addChild(scale9, -2);

            CocoXIB::renderCustomUI(this, m_mainLayer);
        }*/
        return true;
    }
 protected:
    template <typename F>
    friend void CocoXIB::renderCustomUI(F, CCNode*);

    EffectGameObject* m_effectObject;
    CCTextInputNode* m_mainInput;
};

void inject() {
    setupTypeinfos();
    m = new ModContainer("Swag");

    auto editor = Cacao::EditorUIEditor::create(m);

    constexpr int myObjectID = 3142;
    Cacao::addGDObject("checkpoint_01_001.png", myObjectID);

    editor
      ->bar(11)
      ->addIndex(12, myObjectID)
      ->addObjectsToGameSheet02(myObjectID)
      ->addEffectObjects(myObjectID);

    editor->addTriggerCallback(myObjectID, +[](GameObject* self, GJBaseGameLayer* gameLayer) {
        gameLayer->_player1()->_speed() = gameLayer->_player1()->_yAccel();
    });
    
    editor->applyAll();

    void(*lam)(EditorUI*) = +[](EditorUI* self) {
        auto obs = self->getSelectedObjects();
        if (obs->count() == 1) {
            auto o = reinterpret_cast<EffectGameObject*>(obs->objectAtIndex(0));
            if (o->_id() == 3142) {
                SetupSpeedPopup::create(o)->show();
                return;
            }
        }
        ORIG(*lam, 0x195a0)(self);
    };
    m->registerHook(getBase()+0x195a0, lam);

    m->enable();
}
