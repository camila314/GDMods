#include <Cacao.hpp>
#include <iostream>

using namespace cocos2d;
ModContainer* m;
std::string g_clipboard;

void editorUiKilled(EditorUI* self) {
	g_clipboard = self->_clipboard();
	return ORIG(editorUiKilled, 0x8a10)(self);
}
void editorUiMade(EditorUI* self, LevelEditorLayer* lel) {
	ORIG(editorUiMade, 0x8ae0)(self, lel);
	self->_clipboard() = g_clipboard;
	self->updateButtons();
}
void inject() {
	m = new ModContainer("Global Clipboard");
	m->registerHook(getBase()+0x8a10, editorUiKilled);
	m->registerHook(getBase()+0x8ae0, editorUiMade);
	m->enable();
}
