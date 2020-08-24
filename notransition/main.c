#include "MemoryKit.h"
int main() {
	MKProcess p;
	int pid = PidFromName("Geometry Dash");
	MKInit(&p,pid);
	MKProtect(&p,p.base+0x8E974,5,7);
	char data[5] = {0x0F,0x57,0xC0,0x90,0x90};
	MKWrite(&p,data,p.base+0x8E974,5);
	return 0;
}