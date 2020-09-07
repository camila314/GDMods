#include <windows.h>
#include <cstring>

void rd_route(BYTE* address, DWORD jumpTo)
{
	DWORD length = 0x5;
	DWORD oldProtect, newProtect, relativeAddress;
	VirtualProtect(address, length, PAGE_EXECUTE_READWRITE, &oldProtect);
	relativeAddress = (DWORD)(jumpTo - (DWORD)address) - 5;
	*address = 0xE9;
	*((DWORD*)(address + 0x1)) = relativeAddress;
	for (DWORD x = 0x5; x < length; x++)
	{
		*(address + x) = 0x90;
	}
	VirtualProtect(address, length, oldProtect, &newProtect);
}

void writeMemory(BYTE* address, BYTE* content, int length)
{
	DWORD oldProtect, newProtect;
	VirtualProtect(address, length, PAGE_EXECUTE_READWRITE, &oldProtect);
	memcpy((void*)address, (void*)content, length);
	VirtualProtect(address, length, oldProtect, &newProtect);
}