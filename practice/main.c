#include <MKit.h>
void install(void) __attribute__((constructor));
void install() {

	char a1 = 0xEB;
	char a2 = 0xFF;
	writeProcessMemory(baseAddress()+0x72929, 1, &a1);
	//writeProcessMemory(0x7FA1F, 1, 0x85);
	writeProcessMemory(baseAddress()+0x7FA1D, 1, &a2);

	char nops[6] = {0x90,0x90,0x90,0x90,0x90,0x90};
	writeProcessMemory(baseAddress()+0x7ADC9, 6, &nops);
	writeProcessMemory(baseAddress()+0x7AD87, 6, &nops);
	writeProcessMemory(baseAddress()+0x7AD6B, 6, &nops);
}