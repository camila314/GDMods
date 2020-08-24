#include "MemoryKit.c"
#include <stdio.h>
union {
        double f;
        char u[8];
    } fps;
int main() {
	MKProcess p;
	MKInit(&p,PidFromName("Geometry Dash"));
	long codeAddr = 0x1a3f0c+p.base;
	long floatAddr = 0x1a42b7+p.base;

	char redir[19] = { 0xF2, 0x0F, 0x10, 0x05, 0xA3, 0x03, 0x00, 0x00, 0x48, 0x89, 0xD8, 0x48, 0x83, 0xC4, 0x08, 0x5B, 0x5D, 0xFF, 0xE0 };

	MKProtect(&p, codeAddr, 19, 7);
	MKWrite(&p,redir, codeAddr, 19);

	fps.f = 0.01;
	while(1) {
		printf("%s","FPS:");
		scanf("%lf", &fps.f);
		fps.f = 1/fps.f;
		MKProtect(&p, floatAddr, 8, 7);
		MKWrite(&p,fps.u, floatAddr, 8);
	}
	return 0;
}