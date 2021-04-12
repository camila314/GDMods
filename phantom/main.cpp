// replace this code

#include <Cacao.hpp>
#include <iostream>
#include "ConnectorNode.h"
using namespace cocos2d;
ModContainer* m;

std::string createMoveTrigger(CCPoint realpos, CCPoint targetpos, int group) {
    char out[128];
    sprintf(out, "1,901,2,%f,3,%f,36,1,28,%f,29,%f,51,%d,10,0.1", realpos.x, realpos.y-90, targetpos.x, targetpos.y, group);
    std::cout << "our thing " << out << std::endl;
    return std::string(out);
}

std::string createRotateTrigger(CCPoint realpos, float targetrot, int group) {
    char out[128];
    sprintf(out, "1,1346,2,%f,3,%f,36,1,68,%f,51,%d,10,0.1", realpos.x, realpos.y-90, targetrot, group);
    std::cout << "our thing " << out << std::endl;
    return std::string(out);
}

class PhantomEditorUI : public EditorUI {
public:

    void onKeyframe(CCObject* sender) {
        auto so = this->getSelectedObjects();
        if (so->count() > 0) {
            auto ccar = CCArray::create();
            for (int j = 0; j < so->count(); j++) {
                auto i = reinterpret_cast<GameObject*>(so->objectAtIndex(j));
                GameObject* newly = _editorLayer()->addObjectFromString(i->getSaveString());

                ccar->addObject(newly);
                newly->_zOrder() = 314159;


                ConnectorNode* src_connector = ConnectorNode::findFromSource(i);
                if (src_connector) {
                    auto dest = src_connector->getDestinationObject();
                    src_connector->destroy();
                    _editorLayer()->_objectLayer()->addChild(ConnectorNode::create(dest, newly),9<<9);
                }
                auto connector = ConnectorNode::create(newly, i);
                _editorLayer()->_objectLayer()->addChild(connector,9<<9);
                newly->setUserObject(i);

                if (i->_zOrder()==314159) {
                    newly->setFollowingSprite(i->getFollowingSprite());
                } else {
                    connector->setDotEnabled(true);
                    newly->setFollowingSprite(i);
                }
                newly->_type() = 7;

                auto copysprite = CCSprite::createWithSpriteFrame(newly->displayFrame());
                copysprite->setColor(ccc3(255,158,75));
                copysprite->setPosition(ccp(newly->getContentSize().width/2, newly->getContentSize().height/2));
                newly->addChild(copysprite);
            }
            this->deselectAll();
            this->selectObjects(ccar, false);
        }
    }


    std::string recurseChain(GameObject* src, int idx) {
        std::string toPaste;

        auto connection = ConnectorNode::findFromSource(src);
        if (connection) {
            auto kframe = connection->getDestinationObject();

            auto original = reinterpret_cast<GameObject*>(kframe->getFollowingSprite());
            auto metadata = reinterpret_cast<CCNode*>(kframe->getUserObject());
            if (!metadata)
                return toPaste;

            CCPoint amountToMove = kframe->getPosition() - metadata->getPosition();
            float amountToRotate = kframe->getRotation() - metadata->getRotation();

            connection->destroy();
            _editorLayer()->removeObject(kframe, false);

            int newGroup = _editorLayer()->getNextFreeGroupID(_editorLayer()->_objects());
            original->addToGroup(newGroup);
            metadata->release();

            if (amountToMove.x!=0 || amountToMove.y!=0)
                toPaste = toPaste + createMoveTrigger(original->getPosition()+ccp((idx+1) * 30.0f,0), amountToMove, newGroup) + ";";
            if (amountToRotate !=0)
                toPaste = toPaste + createRotateTrigger(original->getPosition()+ccp((idx+1) * 30.0f,30), amountToRotate, newGroup) + ";";

            toPaste += recurseChain(kframe, idx+1);
        }
        return toPaste;
    }
    void onClick(CCObject* sender) {
        std::string toPaste;

        for (int i = 0; i < this->getSelectedObjects()->count(); i++) {
            GameObject* src = reinterpret_cast<GameObject*>(this->getSelectedObjects()->objectAtIndex(i));
            if (src->_zOrder() != 314159 && ConnectorNode::findFromSource(src)) {
                toPaste += this->recurseChain(src, 0);
            }
        }
        ORIG(h_deselectAll, 0x1f300)(this);
        this->pasteObjects(toPaste);
    }

    static void h_init(PhantomEditorUI* self) {
        ORIG(h_init, 0xcb50)(self);
        //d_key01_001.png

        auto menu = CCMenu::create();
        self->addChild(menu);

        auto mybutton = CCSprite::create("GJ_button_05.png");
        mybutton->setScale(0.77);

        auto keyIcon = CCSprite::createWithSpriteFrameName("d_key01_001.png");
        mybutton->addChild(keyIcon);
        keyIcon->setPosition(ccp(mybutton->getContentSize().width/2,mybutton->getContentSize().height/2));
        keyIcon->setScale(0.9);
        mybutton->setChildColor(ccc3(255,57,47));

        auto mitem = CreateMenuItem::create(mybutton, mybutton, self, menu_selector(PhantomEditorUI::onKeyframe));
        menu->addChild(mitem);

        auto dir = CCDirector::sharedDirector();
        float top = dir->getScreenTop()-60.0;
        float rgt = dir->getScreenRight()-24.0;

        menu->setPosition(ccp(rgt, top) + ccp(38 * -3, 0));




        auto menu2 = CCMenu::create();
        self->addChild(menu2);

        auto mybutton2 = CCSprite::create("GJ_button_04.png");
        mybutton2->setScale(0.77);

        auto keyHoleIcon = CCSprite::createWithSpriteFrameName("GJ_lock_001.png");
        mybutton2->addChild(keyHoleIcon);
        keyHoleIcon->setPosition(ccp(mybutton2->getContentSize().width/2,mybutton2->getContentSize().height/2));
        keyHoleIcon->setScale(0.9);
        mybutton2->setChildColor(ccc3(235,87,87));
        keyHoleIcon->setOpacity(192);

        auto mitem2 = CreateMenuItem::create(mybutton2, mybutton2, self, menu_selector(PhantomEditorUI::onClick));
        menu2->addChild(mitem2);

        menu2->setPosition(ccp(rgt, top) + ccp(38 * -3, -38));
    }

    static void h_deselectAll(PhantomEditorUI* self) {

        for (int i = 0; i < self->_editorLayer()->_objects()->count(); i++) {
            GameObject* gob = reinterpret_cast<GameObject*>(self->_editorLayer()->_objects()->objectAtIndex(i));
            if (gob->_zOrder() == 314159) {
                //self->_editorLayer()->removeObject(gob, false);
            }
        }
        ORIG(h_deselectAll, 0x1f300)(self);
    }
};

void inject() {
    m = new ModContainer("Keyframes");
    m->registerHook(getBase()+0xcb50, PhantomEditorUI::h_init);
    m->registerHook(getBase()+0x1f300, PhantomEditorUI::h_deselectAll);
    m->enable();
}