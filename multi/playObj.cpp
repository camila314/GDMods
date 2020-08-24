#include <gdstdlib.hpp>
#include <GDML/GDML.hpp>
#include <unistd.h>
using namespace cocos2d;


/*class MyOptionsLayer : FLAlertLayer {
protected:
	CCLayer* layer;
	CCSize winSize;
public:

	CREATE_FUNC(MyOptionsLayer);

	bool init() {
			if(this->initWithColor({.r=0,.g=0,.b=0})) {
				auto director = CCDirector::sharedDirector();
				auto dispatcher = director->getTouchDispatcher();
				this->registerWithTouchDispatcher(dispatcher);

				dispatcher->incrementForcePrio(2);

				this->setKeypadEnabled(true);

				winSize = director->getWinSize();

				layer = CCLayer::create();
				this->addChild(layer);

				CCRect rect(0, 0, 80, 80);
				auto square1 = cocos2d::extension::CCScale9Sprite::create("GJ_square01.png", rect);

				CCSize size(360, 260);
				auto scalex = square1->setContentSize(size);

				layer->addChild(square1);

			}
	}
};*/

ModContainer* play;

// asm stuff
extern "C" {
long base;
long createOriginal;
long createLabel;
extern void addObject(void);
}

void onetime(void* ye, CCPoint const& pt) {
	play->disable();
	FCAST(onetime, play->getOriginal(getBase()+0x1371d0))(ye, pt);

	ObjectToolbox* toolbox = ObjectToolbox::sharedState();

	CCDictionary* val_int = static_cast<CCDictionary*>(toolbox->valOffset(0x128));
	CCDictionary* val_stdstring = static_cast<CCDictionary*>(toolbox->valOffset(0x128));

	val_stdstring->setObject(CCString::createWithFormat("%i", "31415"), std::string("poggersTrigger.png"));
	val_int->setObject(CCString::createWithFormat("%s", "poggersTrigger.png"), 31415);



	const CCString* pogs = val_int->valueForKey(2);

	std::string th(pogs->getCString());
	FLAlertLayer* alrt = FLAlertLayer::create(NULL, "pog", th, "yeah", NULL, 300.0);

	alrt->show();
}
void inject() {
	base=getBase();
	createOriginal = getBase()+0x2f4d0f;
	createLabel = getBase()+0x2f4ec9;

	play = new ModContainer("test", "global");

	play->registerHook(getBase()+0x1371d0, (func_t)onetime);

	ModContainer* custom = new ModContainer("Custom Object", "global");
	custom->registerHook(getBase()+0x2f4ce0, addObject);

	custom->enable();
	play->enable();
}