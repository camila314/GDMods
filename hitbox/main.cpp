#include <CacKit>

class HitboxNode : public CCDrawNode {
 public:
    static HitboxNode* shared;

    static HitboxNode* sharedState(CCNode* parent) {
        if (!shared) {
            shared = HitboxNode::create();
            parent->addChild(shared);
        }
        return shared;
    }
    static HitboxNode* create() {
        auto ret = reinterpret_cast<HitboxNode*>(CCDrawNode::create()); // bad practice go brrrr
        return ret;
    }
    void drawRect(GameObject* ob) {
        if (!ob->_hitbox())
            return;

        auto r = ob->_hitbox()->getBoundingRect();


        if (r.origin.x < 0)
            return;
        
        auto ld = ccp(r.origin.x, r.origin.y);
        auto lu = ld + ccp(0, r.size.height);
        auto rd = ld + ccp(r.size.width, 0);
        auto ru = rd + ccp(0, r.size.height);
        auto color = ccc4FFromccc3B(ccc3(255, 0, 0));
        
        Cacao::printGeometry(ld);
        Cacao::printGeometry(lu);

        drawSegment(ld, lu, 2, color);
        drawSegment(lu, ru, 2, color);
        drawSegment(ru, rd, 2, color);
        drawSegment(rd, ld, 2, color);
    }
};

HitboxNode* HitboxNode::shared = nullptr;

CAC_HOOKS

class: public $PlayLayer {
    void update(float dt) override {
        $PlayLayer::update(dt);
        auto drawer = HitboxNode::sharedState(cac_this->_objectLayer());
        CCObject* loop;
        drawer->clear();
        CCARRAY_FOREACH(cac_this->_objects(), loop) {
            drawer->drawRect(reinterpret_cast<GameObject*>(loop));
        }
    }
} TemplateMod;

END_CAC_HOOKS