#include <stdio.h> 
#include <unistd.h> 
#include <sys/types.h> 
#include <sys/ptrace.h> 
#include <mach/mach.h>
#include <mach/mach_vm.h> 
#include <errno.h> 
#include <stdlib.h>
#include <sys/proc_info.h>
#include <libproc.h>
typedef struct MKProcess {
pid_t pid;
uint64_t base;
mach_port_t taskport;
thread_act_port_array_t threads;
mach_msg_type_number_t threadcount;
x86_thread_state64_t state;
} MKProcess;
kern_return_t k2uySGtF4KZUekoUZeQV(mach_port_t task, uint64_t *base);
void MKHandle(char* function,kern_return_t kret);
void MKInit(MKProcess* p,pid_t pid);
void MKGetState(MKProcess* p,int thread);
void MKWrite(MKProcess* p, char* data,mach_vm_address_t addr,size_t len);
char MKRead(MKProcess* p,mach_vm_address_t addr,size_t len);
void MKProtect(MKProcess* p,mach_vm_address_t addr,size_t len,int protection);
int PidFromName(char *name);
