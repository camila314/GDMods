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
	long addrs[3] = {0x18bfa, 0x18f25, 0x1b991};

	char byte = 0xeb;
	for(register int i=0; i<sizeof(addrs)/sizeof(addrs[0]); i++) {
		_patch_memory(base()+addrs[i], 1, &byte);
	}
	char nops[6] = {0x66,0x0F,0x1F,0x44,0x00,0x00};
	long addrs2[3] = {0x949cd, 0x94b1d};
	for(register int i=0; i<sizeof(addrs2)/sizeof(addrs2[0]); i++) {
		_patch_memory(base()+addrs2[i], 6, &nops);
	}
}