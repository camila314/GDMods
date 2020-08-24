#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <rd_route.h>
#include <sys/mman.h>
#include <unistd.h>

typedef int (*go)(struct timeval *tv, struct timezone *tz);

static int t = 1;
static float M = 1;
static int started = 0;

void* input_thread(void*){
    while (getchar()){
        if (t){
            printf("Speedhack disabled");
            t=0;
        } else {
            printf("Speedhack enabled");
            t=1;
        }
    }
    return NULL;
}


static long last_usec;
static long skipped_usec=0;

extern "C" int gettimeofday_(struct timeval *tv, void *tz)
{
    // Testing purposes:
    go gettimeofday_orig;
    int val;
    gettimeofday_orig=(go)dlsym(RTLD_NEXT,"gettimeofday");
    if (!started)
    {
        pthread_t t;
        pthread_create(&t, NULL, input_thread, NULL);

        started=1;
    }

    val = gettimeofday_orig(tv,(struct timezone*)tz);

    long usec = tv->tv_sec*1000000 + tv->tv_usec;
    long delta_usec = usec - last_usec;
    last_usec = usec;

    if (t){
        skipped_usec+= delta_usec*M;
    }

    tv->tv_usec += skipped_usec;

    tv->tv_sec += skipped_usec / 1000000;
    tv->tv_usec += skipped_usec % 1000000;

    return val;
}
void install(void) __attribute__((constructor));

void install() {
void *mainProgramHandle = dlopen(NULL, RTLD_NOW);
int64_t *origFunc = (int64_t *)(base()+0x19eac0);//(int64_t*)dlsym(mainProgramHandle , "DYLD-STUB$$gettimeofday");
int64_t *newFunc = (int64_t*)&gettimeofday_;
int32_t offset = (int64_t)newFunc - ((int64_t)origFunc + 5 * sizeof(char));

    //Make the memory containing the original funcion writable
    //Code from http://stackoverflow.com/questions/20381812/mprotect-always-returns-invalid-arguments
    size_t pageSize = sysconf(_SC_PAGESIZE);
    uintptr_t start = (uintptr_t)origFunc;
    uintptr_t end = start + 1;
    uintptr_t pageStart = start & -pageSize;
    mprotect((void *)pageStart, end - pageStart, PROT_READ | PROT_WRITE | PROT_EXEC);

    //Insert the jump instruction at the beginning of the original function
    int64_t instruction = 0xe9 | offset << 8;
    *origFunc = instruction;

printf("%llx\n",origFunc);
}