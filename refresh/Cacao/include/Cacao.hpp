#ifndef __CACAO_HPP__
#define __CACAO_HPP__

#include <cc_defs.hpp>


namespace Cacao {
	typedef void (cocos2d::CCObject::* CC_SEL)(cocos2d::CCObject*);

/*	class CacaoToggle : public cocos2d::CCObject {
	public:
		CacaoToggle(cocos2d::CCObject* ob, CC_SEL on_, CC_SEL off_) {
			obj = ob;
			on = on_;
			off = off_;
			is_on = false;
		};
		void onToggle(cocos2d::CCObject* o) {
			if (is_on) {
				(obj->*on)(o);
			} else {
				(obj->*off)(o);
			}
			is_on = !is_on;
		};
	protected:
		cocos2d::CCObject* obj;
		CC_SEL on;
		CC_SEL off;
		bool is_on;
	};*/
	cocos2d::CCPoint relativePosition(double x, double y) {
		auto winSize = cocos2d::CCDirector::sharedDirector()->getWinSize();
		float xp = winSize.width * (x/100.);
		float yp = winSize.height * (y/100.);
		return {.x = xp , .y = yp};
	}
	cocos2d::CCSprite* spriteFromPng(unsigned char* img, int img_len) {
		auto image = new cocos2d::CCImage();
		image->initWithImageData((void*)img, img_len, cocos2d::CCImage::kFmtPng,1,1,1);

		auto text = new cocos2d::CCTexture2D();
		text->initWithImage(image);

		cocos2d::CCRect r(0, 0, image->getWidth(), image->getHeight());

		std::cout << image->getWidth() << "\n";
		std::cout << image->getHeight() << "\n";

		auto sprite = cocos2d::CCSprite::create();
		sprite->initWithTexture(text, r);

		sprite->setTexture(text);

		return sprite;
	}

	CCMenuItemToggler* createToggler(cocos2d::CCObject* parent, CC_SEL callback) {
		auto on = cocos2d::CCSprite::createWithSpriteFrameName("GJ_checkOn_001.png");
		auto off = cocos2d::CCSprite::createWithSpriteFrameName("GJ_checkOff_001.png");
		return CCMenuItemToggler::create(off, on, parent, callback);
	}
}

#endif