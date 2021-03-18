#include <Cacao.hpp>
#include <iostream>
#include <cstdlib>
using namespace cocos2d;

void testhook(void* idfk);

ModContainer* m;


void inject() {
	m = new ModContainer("amogus");
	auto a = new FLAlertLayer;
	a->onEnter();
}