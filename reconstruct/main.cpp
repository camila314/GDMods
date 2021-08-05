#define CAC_PROJ_NAME "Physics reconstruction"
#include <CacKit>

class: public $PlayerObject {
	void propellPlayer(float amount) override {
	    cac_this->_isRising() = true;
	    cac_this->_isSliding() = false;
	    cac_this->_onGround() = false;
	    cac_this->__member<bool>(0x62b) = true;
	    cac_this->_yAccel() = 16 * amount * (cac_this->_upsideDown() ? -1.0 : 1.0) * (cac_this->_vehicleSize() == 1.0 ? 1.0 : 0.8);

	    if (cac_this->_isBall() || cac_this->_isSpider()) {
	        cac_this->_yAccel() *= 0.6;
	    }
	    cac_this->runRotateAction(false);
	    if (GM->_ldm() && cac_this->_inPlayLayer()) {
	        auto circleWave = CCCircleWave::create(amount == 1.25 ? 12.0 : 10.0, 40.0, 0.25, false);

	        auto col = ccc3(255, 200, 0);
	        if (amount == 0.8) {
	            col = ccc3(0, 255, 255);
	        } else if (amount < 1.0) {
	            col = ccc3(255, 0, 255);
	        }
	        circleWave->_color() = col;
	        circleWave->setPosition(cac_this->_lastPortalLocation());

	        if (cac_this->_lastPortal()) {
	            circleWave->followObject(cac_this->_lastPortal(), true);
	            circleWave->_delegate() = PL;
	            PL->addCircle(circleWave);
	        }
	        cac_this->__member<CCLayer*>(0x798)->addChild(circleWave, 0);
	    }
	    if (cac_this->_isRobot()) {
	        cac_this->_robotSprite()->runAnimation("jump_start");
	    } else if (cac_this->_isSpider()) {
	        cac_this->_spiderSprite()->runAnimation("fall_loop");
	    }
	    cac_this->activateStreak();
	    cac_this->_lastHitGround() = cac_this->getPosition();
	}
} MyMod;

APPLY_HOOKS();
