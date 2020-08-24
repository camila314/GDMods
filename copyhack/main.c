#include <rd_route.h>
#include <mach/mach_init.h>
#include <assert.h> 

#define RDErrorLog(format, ...) fprintf(stderr, "%s:%d:\n\terror: "format"\n", \
	__FILE__, __LINE__, ##__VA_ARGS__)

kern_return_t _patch_memory(void *address, mach_msg_type_number_t count, uint8_t *new_bytes)
{
	assert(address);
	assert(count > 0);
	assert(new_bytes);

	kern_return_t kr = 0;
	kr = mach_vm_protect(mach_task_self(), (mach_vm_address_t)address, (mach_vm_size_t)count, FALSE, VM_PROT_READ | VM_PROT_WRITE | VM_PROT_EXECUTE | VM_PROT_COPY);
	if (kr != KERN_SUCCESS) {
		RDErrorLog("mach_vm_protect() failed with error: 0x%x", kr);
		return (kr);
	}

	kr = mach_vm_write(mach_task_self(), (mach_vm_address_t)address, (vm_offset_t)new_bytes, count);
	if (kr != KERN_SUCCESS) {
		RDErrorLog("mach_vm_write() failed with error: 0x%x", kr);
		return (kr);
	}

	kr = mach_vm_protect(mach_task_self(), (mach_vm_address_t)address, (mach_vm_size_t)count, FALSE, VM_PROT_READ | VM_PROT_EXECUTE);
	if (kr != KERN_SUCCESS) {
		RDErrorLog("mach_vm_protect() failed with error: 0x%x", kr);
	}

	return (kr);
}

void install(void) __attribute__((constructor));
void install() {

	char byte = 0xeb;
	//_patch_memory(base()+0x160895, 1, &byte);

	char cmp[2] = {0x39,0xd2};
	_patch_memory(base()+0x1608bc, 2, &cmp);

	char nops[2] = {0x66,0x90};
	_patch_memory(base()+0x163712, 2, &nops);
	_patch_memory(base()+0x160895, 2, &nops);
}