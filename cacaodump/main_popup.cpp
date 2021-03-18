#include <Cacao.hpp>
#include <iostream>
#include <cstdlib>
#include <algorithm>

using namespace cocos2d;
ModContainer* m;
class SetupCustomPopup;

std::vector<int>* gRepeats;

void rUpdateSpawnTriggers(GJEffectManager* self, float delta) {// var_14
    int index = 0;
    CCArray* spawnActions = self->_spawnActions();
    while (index < spawnActions->count()) {
        SpawnTriggerAction* action = reinterpret_cast<SpawnTriggerAction*>(spawnActions->objectAtIndex(index)); // rax

        if (action->timer == -1.0) {
            action->timer = 0;
            index++;
            continue;
        }
        if (!action->timerEnded) {
            action->timer += delta;
        }
        action->timerEnded = action->timer >= action->delay;

        if (action->timerEnded) {
                GJBL->spawnGroup(action->group);
                if(std::find(gRepeats->begin(), gRepeats->end(), action->uuid) != gRepeats->end()) {
                    action->timerEnded = false;
                    action->timer = -1.0;
                    spawnActions->addObject(action);
                }
                spawnActions->removeObjectAtIndex(index);
        } else {
            index++;
        }
    }
    return;
}
void (*hOrig)(SetupCustomPopup*);
class SetupCustomPopup : public SetupSpawnPopup {
 public:
    static void hInit(SetupCustomPopup* self) {
        hOrig(self);
        self->createToggleButton(
            "Repeat",
            menu_selector(SetupCustomPopup::onRepeat),
            !self->_object()->_touchHoldMode(),
            self->_mainMenu(),
            Cacao::addedPosition(-130,45),
            nullptr);
    }
    void onRepeat(CCObject* ob) {
        bool& mode = this->_object()->_touchHoldMode();
        mode = !mode;
        if (mode) {
            gRepeats->push_back(this->_object()->_uuid());
        } else {
            gRepeats->erase(std::remove(gRepeats->begin(), gRepeats->end(), this->_object()->_uuid()), gRepeats->end());
        }
        return;
    }
};

void inject() {
    gRepeats = new std::vector<int>;

    m = new ModContainer("Custom Trigger Popup");
    hOrig = m->registerHook(getBase()+0x139950, SetupCustomPopup::hInit);
    m->registerHook(getBase()+0x182510, rUpdateSpawnTriggers);
    m->enable();
}
