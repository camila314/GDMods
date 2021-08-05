#define CAC_PROJ_NAME "NoclipAccuracy"
#include <CacKit>
#include <GDML/lowLevel.hpp>

static float frames, noclipped_frames = 0;

class $redirect(PlayLayer) {
public:
	void resetLevel() {
		$PlayLayer::resetLevel();
		frames = noclipped_frames = 0;
	}
	void destroyPlayer(PlayerObject* p, GameObject* g) {
		if (frames>14) noclipped_frames++;
	}
	void checkCollisions(PlayerObject* p, float g) {
		frames++;
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