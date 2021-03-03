#include <Cacao.hpp>
#include <iostream>
#include <cstdlib>
using namespace cocos2d;
ModContainer* m;

void hObjSetup(GameObject* self) { // GameObject::customSetup
	int id = self->_id();
	if (id == 3141) {
		self->_id() = 901;
	}
	ORIG(hObjSetup, 0x2fbba0)(self);
	self->_id() = id;
}

void hTriggerObject(GameObject* self, GJGameBaseLayer* layer) { // GameObject::triggerObject
	if (self->_id() == 3141) {
		PlayerObject* pl = layer->_player1();
		CCArray* objects = layer->_objects();

		CCObject* ob;
		CCARRAY_FOREACH(objects, ob) {
			GameObject* gob = reinterpret_cast<GameObject*>(ob);
			if (gob->getGroupID(0) == self->getGroupID(0) && self->_uuid() != gob->_uuid()) {
				CCPoint pos = gob->getPosition();
				pos.x += 100;
				pl->setPosition(pos);
				pl->setPositionX(pl->getPositionX()-100);
				break;
			}
		}
	} else {
		ORIG(hTriggerObject, 0x2fa8f0)(self, layer);
	}
}

void hSetupMenus(EditorUI* self) {
	ORIG(hSetupMenus, 0xcb50)(self);
	EditButtonBar* theBar = static_cast<EditButtonBar*>(self->_editBars()->objectAtIndex(11));

	// please forgive me for this
	// i couldn't find CCArray::insertObject
	CCArray* why = CCArray::create();
	CCObject* ob;
	int counter = 0;
	CCARRAY_FOREACH(theBar->_objectSlots(), ob) {
		counter++;
		if (counter==4) {
			why->addObject(self->getCreateBtn(3141, 4));
		}
		why->addObject(ob);
	}

	theBar->loadFromItems(why, 6, 2, false);
}

void inject() {
	m = new ModContainer("Custom Trigger");
	Cacao::addGDObject("edit_eCounterBtn_001.png", 3141);

	m->registerHook(getBase()+0x2fbba0, hObjSetup);
	m->registerHook(getBase()+0x2fa8f0, hTriggerObject);
	m->registerHook(getBase()+0xcb50, hSetupMenus);
	m->enable();
}
