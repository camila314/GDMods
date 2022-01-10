#include <Cacao>
using namespace cocos2d;
class $redirect(EditorUI) {
	bool ccTouchBegan(CCTouch* t, CCEvent* e) {
		printf("insane\n");
		auto kdispatcher = CCDirector::sharedDirector()->getKeyboardDispatcher();
		if (kdispatcher->getAltKeyPressed()) {
			$field<bool>("m_zoomClick") = true;
			return true;
		} else return $EditorUI::ccTouchBegan(t, e);
	}
	void ccTouchMoved(CCTouch* t, CCEvent* e) {
		if ($field<bool>("m_zoomClick")) {
			// magic here
			float startDistance = t->m_prevPoint.getDistance(CCPointZero);
			float fromStart = t->m_point.getDistance(CCPointZero) - startDistance;

			auto unclamped = this->_editorLayer()->_objectLayer()->getScale()+(fromStart/50.0);
			$EditorUI::updateZoom(fmax(0.1, fmin(20, unclamped)));

		} else $EditorUI::ccTouchMoved(t, e);
	}
	void ccTouchEnded(CCTouch* t, CCEvent* e) {
		if ($field<bool>("m_zoomClick")) {
			$field<bool>("m_zoomClick") = false;
		} else $EditorUI::ccTouchEnded(t, e);
	}
};