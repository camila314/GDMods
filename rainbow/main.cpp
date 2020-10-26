#include <GDML/GDML.hpp>
#include <gdstdlib.hpp>
#include <cmath>

extern "C" {
	extern void shiftHue(cocos2d::_ccColor3B* color, float shift);
}
cocos2d::_ccColor3B* its;
cocos2d::_ccColor3B* its2;
ModContainer* main;

void check() {

	auto man = GameManager::sharedState();

	PlayLayer* layer = (PlayLayer*)man->valOffset(0x180);
	if(layer) {
		PlayerObject* pla1 = (PlayerObject*)layer->valOffset(0x380);
		PlayerObject* pla2 = (PlayerObject*)layer->valOffset(0x388);

		if(pla1) {
			pla1->setColor(*its);
			pla1->setSecondColor(*its2);

			shiftHue(its, 0.25);
			shiftHue(its2, 0.25);
		}
		if(pla2) {
			pla2->setColor(*its2);
			pla2->setSecondColor(*its);
		}
	}
}

bool hookd(void* inst) {
	check();
	return FCAST(hookd, main->getOriginal(getBase()+0x21a4e0))(inst);
}
void inject() {
	its = new cocos2d::_ccColor3B;
	its2 = new cocos2d::_ccColor3B;

	*its = {.r=255, .g=0, .b=0};
	*its2 = {.r=255, .g=0, .b=0};
	shiftHue(its2, 90);


	main = new ModContainer("gay icon", "global");
	main->registerHook(getBase()+0x21a4e0, (func_t)hookd);
	main->enable();
}