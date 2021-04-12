// Copyright 2021 camden314
#include "ConnectorNode.h"

CCArray* ConnectorNode::connectorPool = nullptr;

void ConnectorNode::destroy() {
    ConnectorNode::connectorPool->removeObject(this);
    this->removeFromParentAndCleanup(true);
}
void ConnectorNode::updateDraw(CCObject* sender) {
    this->clear();
    if (!LEL->_objects()->containsObject(getSourceObject())) {
        this->destroy();
        return;
    }

    this->drawSegment(
        getDestinationObject()->getPosition(), 
        getSourceObject()->getPosition(), 
        1,
        ccc4FFromccc3B(ccc3(240, 151, 43)));
    if (this->getDotEnabled()) {
        this->drawSegment(
            getSourceObject()->getPosition(), 
            getSourceObject()->getPosition(), 
            3, 
            ccc4FFromccc3B(ccc3(255, 16, 16)));
    }
}
ConnectorNode* ConnectorNode::create(GameObject* dest, GameObject* src) {
    auto pret = reinterpret_cast<ConnectorNode*>(CCDrawNode::create());
    auto storage = CCArray::create();
    storage->addObject(dest);
    storage->addObject(src);

    pret->setUserObject(storage);
    pret->schedule(schedule_selector(ConnectorNode::updateDraw), 0);

    if (!ConnectorNode::connectorPool) {
        ConnectorNode::connectorPool = CCArray::create();
        ConnectorNode::connectorPool->retain();
    }
    ConnectorNode::connectorPool->addObject(pret);
    return pret;
}

GameObject* ConnectorNode::getDestinationObject() {
    return reinterpret_cast<GameObject*>(
        reinterpret_cast<CCArray*>(getUserObject())
        ->objectAtIndex(0));
}
GameObject* ConnectorNode::getSourceObject() {
    return reinterpret_cast<GameObject*>(
        reinterpret_cast<CCArray*>(getUserObject())
        ->objectAtIndex(1));
}

ConnectorNode* ConnectorNode::findFromSource(GameObject* src) {
    if (!ConnectorNode::connectorPool)
        return nullptr;
    for (int i=0; i<ConnectorNode::connectorPool->count(); i++) {
        auto cn = reinterpret_cast<ConnectorNode*>(ConnectorNode::connectorPool->objectAtIndex(i));
        if (cn->getSourceObject() == src)
            return cn;
    }
    return nullptr;
}

bool ConnectorNode::getDotEnabled() {
    return reinterpret_cast<uintptr_t>(this->getUserData())>0;
}
void ConnectorNode::setDotEnabled(bool set) {
    this->setUserData(reinterpret_cast<void*>(set ? 0x2 : 0x0));
}