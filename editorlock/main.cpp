#include <GDML/GDML.hpp>
ModContainer* m;
void* editor_update(void* inst, float fps) {
	return FCAST(editor_update, m->getOriginal(getBase()+0xa1b70))(inst, 1/60.);
}
void inject() {
	m = new ModContainer("Editor Lock");
	m->registerHook(getBase()+0xa1b70, (func_t)editor_update);
	m->enable();
}