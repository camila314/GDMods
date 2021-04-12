// replace this code

#include <Cacao.hpp>
#include <iostream>
#include <vector>
#include <string>
#include <sstream>
using namespace cocos2d;
ModContainer* m;

void pushButton(PlayerObject* self, int btn) {
	ORIG(pushButton, 0x22aa00)(self, btn);
	if (!self->_inEditLayer()) {
		auto label = reinterpret_cast<CCLabelBMFont*>(PL->getUserObject());
		if (!label)
			return;
		auto v = reinterpret_cast<std::vector<double>*>(label->getUserData());

		if (v->back() p-> PL->_time()) {
			v->empty();
			v->push_back(0.0);
		}

		if (v->size()>15)
			v->erase(v->begin());

		v->push_back(PL->_time());

		float dsum;
		for (size_t i=1; i<v->size(); i++) {
			dsum+=(v->at(i) - v->at(i-1));
		}
		dsum /= v->size()-1;

		std::ostringstream ss;
		ss.precision(2);
		ss << 1/dsum << " CPS";
		std::string s(ss.str());
		label->setString(s.c_str());
	}
}

void playInit(PlayLayer* self, GJGameLevel* gl) {
	ORIG(playInit, 0x6b5f0)(self, gl);
	auto label = CCLabelBMFont::create("0 CPS", "bigFont.fnt");
	label->setPosition(Cacao::relativePosition(30,70));
	label->setScale(0.6);

	std::vector<double>* ok = new std::vector<double>();
	ok->push_back(0.0);

	label->setUserData(ok);
	self->setUserObject(label);
	self->addChild(label);
}

void inject() {
	m = new ModContainer("Cps thingy");
	m->registerHook(getBase()+0x6b5f0, playInit);
	m->registerHook(getBase()+0x22aa00, pushButton);
	m->enable();
	// ...
}