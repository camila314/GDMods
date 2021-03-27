// replace this code

#include <Cacao.hpp>
#include <iostream>
using namespace cocos2d;
ModContainer* m;

float g_biggestXpos;
CCLabelBMFont* theText;
float onChangeX(EditorUI* self, int xpos) {
	std::cout << "yeah ok\n";
	float out = ORIG(onChangeX, 0x1c6f0)(self, xpos);
	float editorPos = ((-self->_editorLayer()->_mainLayer()->getPositionX()) - out)/self->_editorLayer()->_mainLayer()->getScale();
	float percent = fmin((g_biggestXpos != 0.0 ? (editorPos/g_biggestXpos) * 100 : 100.0), 100.0);

	if (theText) {
		theText->setString(CCString::createWithFormat("%d%%", (int)percent)->getCString());
	}
	return out;
}

void setPos(GameObject* self, CCPoint pos) {
	ORIG(setPos, 0x335850)(self, pos);
	if (self && self->_inEditLayer()) {
		if (self->getPositionX() > g_biggestXpos)
			g_biggestXpos = self->getPositionX();
	}
}

void editInit(EditorUI* self, LevelEditorLayer* lel) {
	ORIG(editInit, 0x8ae0)(self, lel);
	if (!theText) {
		theText = CCLabelBMFont::create("0%%", "bigFont.fnt");
		theText->retain();
	}
	self->_locationSlider()->addChild(theText);
	theText->setPosition(CCPoint(-135, 0));
	theText->setScale(0.6);
}


void inject() {
	g_biggestXpos = 1.0;
	m = new ModContainer("Based");

	m->registerHook(getBase()+0x8ae0, editInit);
	m->registerHook(getBase()+0x1c6f0, onChangeX);
	m->registerHook(getBase()+0x335850, setPos);
	m->enable();
	// ...
}