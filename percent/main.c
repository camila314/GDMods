#include "MemoryKit.h"
void install(void) __attribute__((constructor));

void install() {
	MKProcess p;
	MKInit(&p,PidFromName("Geometry Dash"));

	long addr1 = p.base+0x6EE89;
	char addr1_c[2] = {0xB0,0x01};

	long addr2 = p.base+0x50e8d1;
	char addr2_c[8] = "%.02f%%";

	long addr3 = p.base+0x6EE82;
	char addr3_c[7] = {0x48,0x8D,0x3D,0x48,0xFA,0x49,0x00};

	long addr4 = p.base+0x6EE5B;
	char addr4_c[4] = {0xF3,0x0F,0x5A,0xC0};

	MKProtect(&p,addr1,2,7);
	MKProtect(&p,addr2,8,7);
	MKProtect(&p,addr3,7,7);
	MKProtect(&p,addr4,4,7);

	MKWrite(&p,addr1_c,addr1,2);
	MKWrite(&p,addr2_c,addr2,8);
	MKWrite(&p,addr3_c,addr3,7);
	MKWrite(&p,addr4_c,addr4,4);

}