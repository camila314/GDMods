#include <Cacao.hpp>

ModContainer* m;

void inject() {
	m = new ModContainer("Speed change");
	auto editor = Cacao::EditorUIEditor::create(m);

	constexpr int myObjectID = 3142;
	Cacao::addGDObject("checkpoint_01_001.png", myObjectID);

	editor
	  ->bar(11)
	  ->addIndex(12, myObjectID)
	  ->addObjectsToGameSheet02(myObjectID)
	  ->addEffectObjects(myObjectID);

	editor->addTriggerCallback(myObjectID, +[](GameObject* self, GJBaseGameLayer* gameLayer) {
		gameLayer->_player1()->_speed() = gameLayer->_player1()->_yAccel();
	});
	
	editor->applyAll();
	m->enable();
}