#include <cocos2dx/cocos2d.h>
#include <cocos2dext/cocos-ext.h>
#include <GDML/GDML.hpp>
#include <iostream>
#include <string>

typedef void(*queuefunc)(std::string);

class EventLoop {
private:

	static void runLoop(void* instance) {
		auto event = EventLoop::sharedState();

		if(event->usesEveryFrame) {
			event->everyFrame(" ");
		}

		if(event->thequeue.size()) {
			event->thequeue[0].first(event->thequeue[0].second);

			event->thequeue.erase(event->thequeue.begin());
		}
		return FCAST(EventLoop::runLoop, event->container->getOriginal(getBase()+0x249690))(instance);
	}
public:
	queuefunc everyFrame;
	bool usesEveryFrame;

	ModContainer* container;
	static EventLoop* shared;
	std::vector<std::pair<queuefunc, std::string> > thequeue;

	static EventLoop* sharedState() {
		if(!EventLoop::shared)
			EventLoop::shared = new EventLoop();
		return EventLoop::shared;
	}
	void dispatch_main(queuefunc f, std::string s) {
		thequeue.push_back(std::make_pair(f, s));
	}
	void start() {
		container->enable();
	}
	EventLoop() {
		everyFrame = NULL;

		container = new ModContainer("MainEventLoop", "global");
		container->registerHook(getBase()+0x249690,(func_t)EventLoop::runLoop);
	}

};
EventLoop* EventLoop::shared = 0;

#define CREATE_FUNC(__TYPE__) \
static __TYPE__* create() \
{ \
    __TYPE__ *pRet = new(std::nothrow) __TYPE__(); \
    if (pRet && pRet->inits()) \
    { \
        pRet->autorelease(); \
        return pRet; \
    } \
    else \
    { \
        delete pRet; \
        pRet = nullptr; \
        return nullptr; \
    } \
}

#define CLASS_PARAM(__TYPE__,__GETTER__, __OFFSET__) \
	inline __TYPE__ __GETTER__() {return static_cast<__TYPE__>(this->valOffset(__OFFSET__));}
class GDObj { 
public:
	void* valOffset(long offset);
	void setValOffset(long offset, void* setter);
};

class EditorUI : public GDObj {
public:
	void pasteObjects(std::string str);
	void undoLastAction();
	void redoLastAction();
};

class LevelEditorLayer : public GDObj {
public:
	void createObjectsFromString(std::string st, bool idk);
	void removeAllObjects();
	void undoLastAction();
	void redoLastAction();
};

class AppDelegate : public GDObj {
public:
	CLASS_PARAM(cocos2d::CCScene*, runningScene, 0x28);
	static AppDelegate* get();
};

class PlayLayer : public GDObj {
public:
	static PlayLayer* create();
};

class GameSoundManager : public GDObj {
public:
	static GameSoundManager* sharedManager();
	void stopBackgroundMusic();
	virtual ~GameSoundManager();
};
class GameManager : public GDObj {
public:
	static GameManager* sharedState();
	bool getGameVariable(char const* var);
	void setGameVariable(char const* var, bool val);
	void fadeInMusic(char const* ye);
	void reloadAllStep5();
	void doQuickSave();
	void reloadAll(bool a, bool b, bool c);
	void accountStatusChanged();
	void load();

	void setSecondColorIdx(int idx);
	void setFirstColorIdx(int idx);
	cocos2d::_ccColor3B const& colorForIdx(int idx);
	std::string& manFile();
	virtual ~GameManager();
};

class GameObject : public GDObj {
public:
	GameObject();
	void init(char const* frame);
	void setPosition(cocos2d::CCPoint const& pt);
	void destroyObject();
};

class PlayerObject : public GameObject { 
public:
	static PlayerObject* create(int icn, int icon, cocos2d::CCLayer*);
	void addAllParticles();
	void setColor(cocos2d::_ccColor3B const&);
	void setSecondColor(cocos2d::_ccColor3B const&);
};

class ObjectToolbox : public GDObj {
public:
	static ObjectToolbox* sharedState();
};

class CCMenuItemSpriteExtra : public cocos2d::CCSprite {
public:
	static CCMenuItemSpriteExtra* create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, void (cocos2d::CCObject::*)(cocos2d::CCObject*));
	void setSizeMult(float a);
};
class FLAlertLayer : public cocos2d::CCLayerColor, public GDObj {
public:
	FLAlertLayer();
	static FLAlertLayer* create(void* fdsg, char const* x, const std::string &thing, char const* l, char const* u, float f);
	int show();
};

class MenuLayer : public cocos2d::CCLayer, public GDObj {
public:
	void onQuit(cocos2d::CCObject*);
	void keyBackClicked();
};
class MoreVideoOptionsLayer : public FLAlertLayer {
public:
	static MoreVideoOptionsLayer* create();
	bool init();

};

class GJSearchObject : public GDObj {
public:
	static GJSearchObject* create(int, std::string, std::string, std::string, int, bool, bool, bool, int, bool, bool, bool, bool, bool, bool, bool, bool, int, int);
};

class LevelBrowserLayer : public GDObj {
public:
	static cocos2d::CCScene* scene(GJSearchObject* search);
};

/*class GDHttpRequest : public cocos2d::extension::CCHttpRequest, public GDObj { 
public:
	CLASS_PARAM(char const**, url, 0x28);
};*/