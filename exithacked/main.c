#include <MKit.h>
void inject(){writeProcessMemory(baseAddress()+0xB11C1,3,"\x30\xc0\x90")}