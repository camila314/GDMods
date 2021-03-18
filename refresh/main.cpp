#include <Cacao.hpp>
#include <iostream>

using namespace cocos2d;

class HInfoLayer;
ModContainer* m;

void (*initOrig)(HInfoLayer*, GJGameLevel*, GDObj*);
void (*closeOrig)(HInfoLayer*, CCObject*);

bool toggled = false;
class HInfoLayer : InfoLayer {
 public:
    void onRef(float o) {
        auto val = CCString::createWithFormat("%lf", 0.0);

        GameLevelManager::sharedState()
            ->_timerDict()
            ->setObject(val, "upd_comments");

        this->onRefreshComments(NULL);
    }

    void onTog(CCObject*) {
        toggled = !toggled;
        if (toggled) {
            this->schedule(schedule_selector(HInfoLayer::onRef), 2);
        } else {
            this->unschedule(schedule_selector(HInfoLayer::onRef));
        }
    }

    static void initHook(HInfoLayer* self, GJGameLevel* lvl, GDObj* score) {
        toggled = false;

        initOrig(self, lvl, score);

        /*auto tog = Cacao::createToggler(self, menu_selector(HInfoLayer::onTog));

        tog->setScale(0.8);

        CCPoint pos = Cacao::relativePosition(50, 50);
        pos.x += 195;
        pos.y += 80;
        CCPoint nspace = self->_rightMenu()->convertToNodeSpace(pos);

        tog->setPosition(nspace);

        self->_rightMenu()->addChild(tog);*/

        auto wSize = CCDirector::sharedDirector()->getWinSize();
        float hwidth = wSize.width/2;
        float hheight = wSize.height/2;
        typedef void (CCObject::*menusel)(CCObject*);
        auto mainLayer = self->_rightMenu();

    auto idARS_b1_PIU_l = CCLabelBMFont::create("swag lord", "chatFont.fnt");
    //idARS_b1_PIU_l->setScale(14.0);
    CCPoint idARS_b1_PIU_pos(-150.5 + hwidth, 96.0 + hheight);
    idARS_b1_PIU_l->setPosition(mainLayer->convertToNodeSpace(idARS_b1_PIU_pos));
    }
};

void inject() {
    m = new ModContainer("Swag");

    initOrig = m->registerHook(getBase()+0x456850, HInfoLayer::initHook);

    m->enable();
}
