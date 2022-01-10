#define CAC_PROJ_NAME "NoclipAccuracy"
#include <CacKit>
#include <GDML/lowLevel.hpp>

static float frames, noclipped_frames = 0;

_ccColor3B pcol1;
_ccColor3B pcol2;

class $redirect(PlayLayer) {
public:
	void resetLevel() {
		$PlayLayer::resetLevel();
		frames = noclipped_frames = 0;

		pcol1 = this->_player1()->_pCol1();
		pcol2 = this->_player1()->_pCol2();
	}
	void destroyPlayer(PlayerObject* p, GameObject* g) {
		if (frames>20) {
			noclipped_frames++;
			p->setColor(ccc3(255,50,0));
			p->setSecondColor(ccc3(255,50,0));
		}
	}
	void checkCollisions(PlayerObject* p, float g) {
		if (this->_levelComplete()) {
			$PlayLayer::checkCollisions(p, g);
			return;
		}
		frames++;

		p->setColor(pcol1);
		p->setSecondColor(pcol2);
		$PlayLayer::checkCollisions(p, g);

		char ok[20];
		sprintf(ok, "%.2f%%", 100*(1.0 - (noclipped_frames/frames)));
		reinterpret_cast<CCLabelBMFont*>(getChildByTag(31403))->setString(ok);
	}
	bool init(GJGameLevel* p0) {
		$PlayLayer::init(p0);

		auto text = CCLabelBMFont::create("100%", "bigFont.fnt");
		text->setPosition(Cacao::addedPosition(-140, 151));
		text->setTag(31403);
		text->setScale(0.5);
		addChild(text, 10);
		frames = noclipped_frames = 0;
		return true;
	}
} PlayHook;

void inject() {
	writePM(getBase()+0x72351, 2, const_cast<char*>("\x90\x90"));
}

$apply();