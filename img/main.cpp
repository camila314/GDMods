#include <Cacao.hpp>
#include <iostream>

class MyPauseLayer;

typedef struct {
	void* data;
	int width;
	int height;
} VideoData;

extern "C" {
	void writeToVideo(void* data[], int width, int height, char const* path, int length);
	void writeToPng(void* data, int width, int height, char const* path);
}

using namespace cocos2d;

ModContainer* m;

void (*updateOrig)(PlayLayer*, float);
void (*initOrig)(MyPauseLayer*, bool);

std::vector<VideoData>* vec;

class MyPauseLayer : PauseLayer {
public:
	void onClick(CCObject* o) {
		PlayLayer* pl = GameManager::sharedState()->_playLayer();
		if (!pl)
			return;

		CCArray* obs = pl->getChildren();
		CCSize wSize = CCDirector::sharedDirector()->getWinSize();
		auto rtx = CCRenderTexture::create(wSize.width, wSize.height, kTexture2DPixelFormat_RGBA8888);

		rtx->begin();
		//reinterpret_cast<CCNode*>(obs->objectAtIndex(0))->visit(); // anti transparency 
		reinterpret_cast<CCNode*>(obs->objectAtIndex(3))->visit();
		rtx->end();

		auto im = rtx->newCCImage(true);

		writeToPng(im->getData(), im->getWidth(), im->getHeight(), "/Users/jakrillis/projects/gdmods/img/pngs/swag.png");
		vec->clear();
	}
	static void initHook(MyPauseLayer* self, bool i) {
		initOrig(self, i);

		CCSize wSize = CCDirector::sharedDirector()->getWinSize();
		CCPoint btnLoc(wSize.width/3, wSize.height/3 + 40);

		auto sp = CCSprite::createWithSpriteFrameName("GJ_bigDiamond_001.png");
		auto mitem = CCMenuItemSpriteExtra::create(sp, sp, self, menu_selector(MyPauseLayer::onClick));
		auto menu = CCMenu::create();
		menu->addChild(mitem);

		CCPoint bloc = self->convertToNodeSpace(btnLoc);
		//printf("bloc is %d", bloc);
		menu->setPosition(bloc);

		self->addChild(menu);
	}
};

static void updateHook(PlayLayer* self, float delta) {
		updateOrig(self, delta);

		PlayLayer* pl = GameManager::sharedState()->_playLayer();
		if (!pl)
			return;

		CCArray* obs = pl->getChildren();
		CCSize wSize = CCDirector::sharedDirector()->getWinSize();
		auto rtx = CCRenderTexture::create(wSize.width, wSize.height, kTexture2DPixelFormat_RGBA8888);

		rtx->begin();
		//reinterpret_cast<CCNode*>(obs->objectAtIndex(0))->visit(); // anti transparency 
		reinterpret_cast<CCNode*>(obs->objectAtIndex(3))->visit();
		rtx->end();

		auto im = rtx->newCCImage(true);
		VideoData d = {.data=im->getData(), .width=im->getWidth(), .height=im->getHeight()};
		vec->push_back(d);
}

void fpsLock(void* c, float a) {
	FCAST(fpsLock, m->getOriginal(getBase()+0x2446d0))(c, 1./60.f);
}

void inject() {
	vec = new std::vector<VideoData>();

	m = new ModContainer("Render lol");
	//updateOrig = m->registerHook(getBase()+0x77900, updateHook);
	initOrig = m->registerHook(getBase()+0x2a59c0, MyPauseLayer::initHook);
	m->registerHook(getBase()+0x2446d0, fpsLock);
	m->enable();
}