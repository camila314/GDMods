#include <GDML/GDML.hpp>

extern "C" {
	void dispatchAsm();

	int mapKeys(void* nothing, int key) {
		printf("%d\n", key);
		return key;
	}
}
void install(void) __attribute__ ((constructor));
void install() {
	auto mc = new ModContainer("Key Mapper", "global");

	mc->registerHook(getBase()+0xE8190, (func_t)dispatchAsm);

	mc->enable();
}