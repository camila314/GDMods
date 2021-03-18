
namespace CocoXIB {
template <typename T>
void renderCustomUI(T self, CCNode* mainLayer) {
auto wSize = CCDirector::sharedDirector()->getWinSize();
float hwidth = wSize.width/2;
float hheight = wSize.height/2;
typedef void (CCObject::*menusel)(CCObject*);

auto idyms_e4_gEW_l = CCLabelBMFont::create("New X: ", "goldFont.fnt");
idyms_e4_gEW_l->setScale(0.6476190476190476);
CCPoint idyms_e4_gEW_pos(-101.0 + hwidth, 37.0 + hheight);
idyms_e4_gEW_l->setPosition(mainLayer->convertToNodeSpace(idyms_e4_gEW_pos));
mainLayer->addChild(idyms_e4_gEW_l);

auto id5hA_3Y_l6K_l = CCLabelBMFont::create("New Y:", "goldFont.fnt");
id5hA_3Y_l6K_l->setScale(0.6476190476190476);
CCPoint id5hA_3Y_l6K_pos(36.5 + hwidth, 37.0 + hheight);
id5hA_3Y_l6K_l->setPosition(mainLayer->convertToNodeSpace(id5hA_3Y_l6K_pos));
mainLayer->addChild(id5hA_3Y_l6K_l);

auto idrFe_NB_7Pv_l = CCLabelBMFont::create("Teleport Trigger", "goldFont.fnt");
idrFe_NB_7Pv_l->setScale(0.6857142857142857);
CCPoint idrFe_NB_7Pv_pos(0.0 + hwidth, 122.5 + hheight);
idrFe_NB_7Pv_l->setPosition(mainLayer->convertToNodeSpace(idrFe_NB_7Pv_pos));
mainLayer->addChild(idrFe_NB_7Pv_l);

auto idHgp_eM_2bt_sq = extension::CCScale9Sprite::create("square02b_small.png");
auto idHgp_eM_2bt_i = CCTextInputNode::create(50.0, 40.0, "0", "Thonburi", 24, "bigFont.fnt");
idHgp_eM_2bt_sq->setOpacity(100);
idHgp_eM_2bt_sq->setColor(ccc3(0,0,0));
idHgp_eM_2bt_sq->setContentSize(CCSizeMake(60.0, 30.0));

CCPoint idHgp_eM_2bt_loc(105.5 + hwidth, 37.0 + hheight);
idHgp_eM_2bt_i->setPosition(idHgp_eM_2bt_loc);
idHgp_eM_2bt_sq->setPosition(idHgp_eM_2bt_loc);
idHgp_eM_2bt_i->setMaxLabelScale(0.5714285714285714);

mainLayer->addChild(idHgp_eM_2bt_sq);
mainLayer->addChild(idHgp_eM_2bt_i);

auto idrsJ_EI_dqw_m = CCMenu::create();
auto idrsJ_EI_dqw_b = ButtonSprite::create("OK", 47.0, 1, 1, true);
auto idrsJ_EI_dqw_l = +[](void* self, CCObject* ob) {
    // YOUR CODE HERE
    printf("idrsJ_EI_dqw\n");
};
auto idrsJ_EI_dqw_i = CCMenuItemSpriteExtra::create(idrsJ_EI_dqw_b, idrsJ_EI_dqw_b, self, reinterpret_cast<menusel&>(idrsJ_EI_dqw_l));
idrsJ_EI_dqw_m->addChild(idrsJ_EI_dqw_i);
idrsJ_EI_dqw_b->setScale(0.8928571428571429);
mainLayer->addChild(idrsJ_EI_dqw_m);
CCPoint idrsJ_EI_dqw_loc(3.0 + hwidth, -113.0 + hheight);
idrsJ_EI_dqw_m->setPosition(idrsJ_EI_dqw_loc);

auto idain_Fn_flq_sq = extension::CCScale9Sprite::create("square02b_small.png");
auto idain_Fn_flq_i = CCTextInputNode::create(50.0, 40.0, "0", "Thonburi", 24, "bigFont.fnt");
idain_Fn_flq_sq->setOpacity(100);
idain_Fn_flq_sq->setColor(ccc3(0,0,0));
idain_Fn_flq_sq->setContentSize(CCSizeMake(60.0, 30.0));

CCPoint idain_Fn_flq_loc(-28.5 + hwidth, 37.0 + hheight);
idain_Fn_flq_i->setPosition(idain_Fn_flq_loc);
idain_Fn_flq_sq->setPosition(idain_Fn_flq_loc);
idain_Fn_flq_i->setMaxLabelScale(0.5714285714285714);
self->m_mainInput = idain_Fn_flq_i;
mainLayer->addChild(idain_Fn_flq_sq);
mainLayer->addChild(idain_Fn_flq_i);

auto idYNY_S5_BJA_m = CCMenu::create();
mainLayer->addChild(idYNY_S5_BJA_m);
CCPoint idYNY_S5_BJA_pos(-127.0 + hwidth, -58.5 + hheight);
idYNY_S5_BJA_m->setPosition(mainLayer->convertToNodeSpace(idYNY_S5_BJA_pos));
auto idYNY_S5_BJA_l = +[](void* self, CCObject* ob) {
	// YOUR CODE HERE
	printf("idYNY_S5_BJA\n");
};
auto idYNY_S5_BJA_t = Cacao::createToggler(self, reinterpret_cast<menusel&>(idYNY_S5_BJA_l));
idYNY_S5_BJA_t->setScale(0.7142857142857143);
idYNY_S5_BJA_m->addChild(idYNY_S5_BJA_t);

auto idQWC_uD_9bH_m = CCMenu::create();
mainLayer->addChild(idQWC_uD_9bH_m);
CCPoint idQWC_uD_9bH_pos(-127.0 + hwidth, -29.5 + hheight);
idQWC_uD_9bH_m->setPosition(mainLayer->convertToNodeSpace(idQWC_uD_9bH_pos));
auto idQWC_uD_9bH_l = +[](void* self, CCObject* ob) {
	// YOUR CODE HERE
	printf("idQWC_uD_9bH\n");
};
auto idQWC_uD_9bH_t = Cacao::createToggler(self, reinterpret_cast<menusel&>(idQWC_uD_9bH_l));
idQWC_uD_9bH_t->setScale(0.7142857142857143);
idQWC_uD_9bH_m->addChild(idQWC_uD_9bH_t);

auto id3ob_Ii_L7I_l = CCLabelBMFont::create("Spawn Triggered", "bigFont.fnt");
id3ob_Ii_L7I_l->setScale(0.37142857142857144);
CCPoint id3ob_Ii_L7I_pos(-55.0 + hwidth, -58.0 + hheight);
id3ob_Ii_L7I_l->setPosition(mainLayer->convertToNodeSpace(id3ob_Ii_L7I_pos));
mainLayer->addChild(id3ob_Ii_L7I_l);

auto idM9K_3P_c3x_l = CCLabelBMFont::create("Touch Triggered", "bigFont.fnt");
idM9K_3P_c3x_l->setScale(0.37142857142857144);
CCPoint idM9K_3P_c3x_pos(-57.0 + hwidth, -29.0 + hheight);
idM9K_3P_c3x_l->setPosition(mainLayer->convertToNodeSpace(idM9K_3P_c3x_pos));
mainLayer->addChild(idM9K_3P_c3x_l);
} }