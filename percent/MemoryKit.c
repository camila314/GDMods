#include "MemoryKit.h"
kern_return_t k2uySGtF4KZUekoUZeQV(mach_port_t task, uint64_t *base)
{
    vm_map_size_t size;
    uint32_t depth;
    struct vm_region_submap_info_64 vbr;
    mach_msg_type_number_t count = 16;

    return mach_vm_region_recurse(task, base, &size, &depth, (vm_region_recurse_info_t)&vbr, &count);
}
void MKHandle(char* function,kern_return_t kret) {
  if (kret!=KERN_SUCCESS){
    printf("%s returned error %d with message %s\n",function,kret,mach_error_string(kret));
    exit(0);
  }
}
void MKInit(MKProcess* p,pid_t pid) {
p->pid = pid;
MKHandle("task_for_pid",task_for_pid(mach_task_self(), pid,&(p->taskport)));
MKHandle("mach_vm_region_recurse",k2uySGtF4KZUekoUZeQV(p->taskport, &(p->base)));
MKHandle("task_threads",task_threads(p->taskport, &(p->threads), &(p->threadcount)));
}

void MKGetState(MKProcess* p,int thread) {
mach_msg_type_number_t stateCount = x86_THREAD_STATE64_COUNT;
MKHandle("thread_get_state",thread_get_state(p->threads[thread], x86_THREAD_STATE64, (thread_state_t)&(p->state), &stateCount)); 
}

void MKWrite(MKProcess* p, char* data,mach_vm_address_t addr,size_t len) {
  MKHandle("mach_vm_write",mach_vm_write(p->taskport, addr, (vm_offset_t)data, len));
}
char MKRead(MKProcess* p,mach_vm_address_t addr,size_t len) {
char* data = malloc(sizeof(char) * len);
mach_msg_type_number_t data_size;
mach_vm_read(p->taskport,addr,len,(vm_offset_t*)data,&data_size);
return *data;
}
void MKProtect(MKProcess* p,mach_vm_address_t addr,size_t len,int protection) {
  mach_vm_protect(p->taskport, addr, len, FALSE, protection);
}
int PidFromName(char *name)
{
    int proc_count = proc_listpids(PROC_ALL_PIDS, 0, NULL, 0);
    pid_t *pids = malloc(sizeof(pid_t) * proc_count);
    if (proc_listpids(PROC_ALL_PIDS, 0, pids, sizeof(pid_t) * proc_count))
    {
        for (int i = 0; i < proc_count; ++i)
        {
            if (pids[i])
            {
                char buf[PROC_PIDPATHINFO_MAXSIZE];
                if (proc_pidpath(pids[i], buf, sizeof(buf)) && strlen(buf) && !strcmp(name, strrchr(buf, '/') + 1))
                {
                    int pid = pids[i];
                    free(pids);
                    return pid;
                }
            }
        }
    }
    free(pids);
    return 0;
}