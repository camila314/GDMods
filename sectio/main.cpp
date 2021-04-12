#include <Cacao.hpp>
#include <iostream>
using namespace cocos2d;

void lelInit(LevelEditorLayer* self, GJGameLevel* gjgl) {
    ORIG(lelInit, 0x91010)(self, gjgl);

    auto ccdr = CCDrawNode::create();
    self->_objectLayer()->addChild(ccdr);

    for (float i = 0.0; i < 100<<10; i+=100.0) {
        float x = self->_objectLayer()->getPositionX();
        ccdr->drawSegment(ccp(i, -90), ccp(i, 10000), 2, ccc4FFromccc3B(ccc3(179, 42, 0)));
    }
}
void inject() {
    auto m = new ModContainer("Show Sections");
    m->registerHook(getBase()+0x91010, lelInit);
    m->enable();
}