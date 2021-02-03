// replace this code

#include <Cacao.hpp>
#include <iostream>

using namespace cocos2d;

ModContainer* m;

class MyDialogDelegate : public Cacao::FLDialogDelegate {
 protected:
	virtual void onSubmit(Cacao::FLDialogHelper* dl, const std::string& text) {
		dl->close();
		auto fl = FLAlertLayer::create("Submitted", "You said <cg>" + text + "</c>", "Ok");
		fl->show();
	}
};

void onClick(CCObject*) {
	auto delegate = new MyDialogDelegate();
	auto a = Cacao::FLDialogHelper::create(delegate, "My prompt");
	a->show();
}

void inject() {
	char s[100];
	//scanf("%s", &s);
	setupTypeinfos();
	m = new ModContainer("Template code");

	m->registerHook(getBase()+0x1d2b40, onClick);
	m->enable();
}