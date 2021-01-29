// Copyright camden314 2021
#include <stdio.h>
#include <Cacao.hpp>
#include <algorithm>
#include <vector>

class MEditorUI;
constexpr float btn_increment = 38;

using namespace cocos2d;

ModContainer* m;

void (*setupOrig)(MEditorUI*);
class MEditorUI : EditorUI {
 public:
    static std::vector<int> getGroups(GameObject* ob) {
        std::vector<int> gs;

        int gid = 0;
        int iter = 0;
        do {
            gid = ob->getGroupID(iter);
            iter++;
            if (gid!=0)
                gs.push_back(gid);
        } while(gid!=0);
        return gs;
    }
    void selectGroup(CCObject* sender) {
        auto selected_objs = this->getSelectedObjects();
        if (selected_objs->count() != 1)
            return;

        GameObject* o = static_cast<GameObject*>(selected_objs->objectAtIndex(0));
        std::vector<int> templ = getGroups(o);
        if (templ.empty())
            return;
        auto all_objs = this->_editorLayer()->_objects();
        CCArray* new_list = CCArray::create();

        for (int i=0;i<all_objs->count();i++) {
            GameObject* o = static_cast<GameObject*>(all_objs->objectAtIndex(i));
            std::vector<int> to_search = getGroups(o);

            // why does cpp make this complicated
            bool all = true;
            for (int s_g : templ) {
                if(std::find(to_search.begin(), to_search.end(), s_g) == to_search.end()) {
                    all = false;
                }
            }
            if (all) {
                new_list->addObject(o);
            }
        }
        this->selectObjects(new_list, false);
    }
    static void setupHook(MEditorUI* self) {
        setupOrig(self);

        auto menu = CCMenu::create();
        self->addChild(menu);

        auto sprite = CCSprite::createWithSpriteFrameName("GJ_hsvBtn_001.png");
        auto mitem = CCMenuItemSpriteExtra::create(sprite, sprite, self, menu_selector(MEditorUI::selectGroup));
        menu->addChild(mitem);

        auto dir = CCDirector::sharedDirector();
        float top = dir->getScreenTop()-60.0;
        float rgt = dir->getScreenRight()-24.0;
        CCPoint base = {.x=rgt, .y=top};

        CCPoint offset = {.x=btn_increment*-3, .y=0};
        menu->setPosition(base + offset);
    }
};

void inject() {
    m = new ModContainer("Select All Groups");
    setupOrig = m->registerHook(getBase()+0xcb50, MEditorUI::setupHook);
    m->enable();
}