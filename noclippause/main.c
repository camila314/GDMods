#include <MKit.h>
#include <stdbool.h>
long base;
long ogNoclip;
void install(void) __attribute__((constructor));
extern void addNoclip();

void* (*sharedState)();
bool (*getGameVariable)(void*,char const*);
void (*setGameVariable)(void*,char const*,bool);

char onPatch1 = 0xc3;
char offPatch1 = 0x55;

char patch2[2] = {0x90,0x90};

void onToggle() {
	bool noclipOn = getGameVariable(sharedState(),"0420");

	//fprintf(tty(),"%d\n",noclipOn);

	if(noclipOn) {
		setGameVariable(sharedState(),"0420", false);
		writeProcessMemory(baseAddress()+0x7AB80,1,&offPatch1);
	} else {
		setGameVariable(sharedState(),"0420", true);
		writeProcessMemory(baseAddress()+0x7AB80,1,&onPatch1);
	}

	return;
}
void install() {
	base = baseAddress();

	sharedState = base+0x1c2b30;
	getGameVariable = base+0x1cccd0;
	setGameVariable = base+0x1cca80;


	setGameVariable(sharedState(), "0420", false);

	writeProcessMemory(baseAddress()+0x72351, 2, &patch2);

	rd_route(base+0x20b9c0,addNoclip, (void**)&ogNoclip);
}