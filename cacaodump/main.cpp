// replace this code

#include <Cacao.hpp>
#include <iostream>
using namespace cocos2d;
ModContainer* m;

void inject() {
	m = new ModContainer("Template code");

	auto scene = CCDirector::sharedDirector()->getRunningScene();

	printf("%p\n", scene);
	// ...
}