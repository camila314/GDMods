// replace this code

#include <Cacao.hpp>
#include <iostream>
using namespace cocos2d;
ModContainer* m;

#define MY_ARR(s) reinterpret_cast<CCArray*>(s->getUserObject())

bool g_enable = false;
void editUIKeyDown(EditorUI* self, int key) {
	if (key == 0x5A) {
		g_enable = !g_enable;
		std::cout << "ight " << (g_enable?"true":"false") << "\n";
		if (!g_enable) {
			auto g = self->_editorLayer()->getUserObject();
			if (g) {
				g->release();
			}
			self->_editorLayer()->setUserObject(CCArray::create());
		}
	} else if (key == 0x58) {
		auto ar = MY_ARR(self->_editorLayer());
		self->_editorLayer()->handleAction(true, ar);
	} else {
		ORIG(editUIKeyDown, 0x30790)(self,key);
	}
}
void editUIKeyUp(EditorUI* self, int key) {
	if (key == 0x5A) {
		std::cout << "guess not\n";
		g_enable = false;
	} else if (key == 0x58) {
		auto ar = MY_ARR(self->_editorLayer());
		self->_editorLayer()->handleAction(false, ar);
	} else {
		ORIG(editUIKeyUp, 0x312b0)(self,key);
	}
}

void addUndo(LevelEditorLayer* self, UndoObject* undob) {
	ORIG(addUndo, 0x94e20)(self, undob);
	if (g_enable) {
		if (!self->getUserObject()) {
			self->setUserObject(CCArray::create());
		}
		auto ar = MY_ARR(self);
		ar->addObject(undob);
		std::cout << "Captured action\n";
	}
}


void inject() {
	m = new ModContainer("Repetition");
	m->registerHook(getBase()+0x30790, editUIKeyDown);
	m->registerHook(getBase()+0x312b0, editUIKeyUp);
	m->registerHook(getBase()+0x94e20, addUndo);
	m->enable();
}