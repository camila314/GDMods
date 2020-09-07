#include <gdstdlib.hpp>
#include <GDML/GDML.hpp>
#include <unistd.h>
using namespace cocos2d;


class MyOptionsLayer : public FLAlertLayer {
protected:
	CCLayer* layer;
	CCSize winSize;
public:

	CREATE_FUNC(MyOptionsLayer);

	bool inits() {
			if(this->initWithColor({.r=0,.g=0,.b=0})) {
				auto director = CCDirector::sharedDirector();
				auto dispatcher = director->getTouchDispatcher();
				this->registerWithTouchDispatcher();

				dispatcher->incrementForcePrio(2);

				this->setKeypadEnabled(true);

				winSize = director->getWinSize();

				layer = CCLayer::create();
				this->addChild(layer, 100);

				CCRect rect(0, 0, 80, 80);
				auto square1 = cocos2d::extension::CCScale9Sprite::create("GJ_square01.png", rect);

				CCSize size(360, 260);
				square1->setContentSize(size);

				layer->addChild(square1, 100);

			}
	}
};


ModContainer* play;

// asm stuff
extern "C" {
long base;
long createOriginal;
long createLabel;
extern void addObject(void);
}


void onetime() {
	auto toolbox = ObjectToolbox::sharedState();

	CCDictionary* keyInt = static_cast<CCDictionary*>(toolbox->valOffset(0x128));
	CCDictionary* keyStr = static_cast<CCDictionary*>(toolbox->valOffset(0x120));

	auto strid = CCString::createWithFormat("%i", 69420);
	auto strname = CCString::createWithFormat("%s", "poggersTrigger.png");

	keyStr->setObject(strid, std::string("poggersTrigger.png"));
	keyInt->setObject(strname, 69420);

}

int num = 1;
void mainLoop(void* instance) {
	if(num) {
		num=0;

		onetime();
		//GameManager::sharedState()->fadeInMusic("secretLoop03.mp3");

	}
	return FCAST(mainLoop, play->getOriginal(getBase()+0x249690))(instance);
}

void inject() {
	base=getBase();
	createOriginal = getBase()+0x2f4d0f;
	createLabel = getBase()+0x2f4ec9;

	play = new ModContainer("test", "global");

	play->registerHook(getBase()+0x249690, (func_t)mainLoop);

	ModContainer* custom = new ModContainer("Custom Object", "global");
	custom->registerHook(getBase()+0x2f4ce0, addObject);

	play->enable();
}