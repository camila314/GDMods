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


static timeval * timezero = 0;
int gettimeofday_(timeval *tv, struct timezone *tz)
{
    // Testing purposes:
    go gettimeofday_orig;
    int val;
    gettimeofday_orig=(go)dlsym(RTLD_NEXT,"gettimeofday");
    if (!timezero)
    {
        timezero = new timeval;
        val = gettimeofday_orig(timezero,tz);
        (*tv) = (*timezero);
        return val;
    }
    // Multiply speed:
    int M = 1;
    // Divide speed:
    int N = 2;
    // That means 1/2 speed;

    val = gettimeofday_orig(tv,tz);
    // Multiply the seconds:
    if(t) {
    tv->tv_sec = M*tv->tv_sec - M*timezero->tv_sec + N*timezero->tv_sec;
    // Multiply the microseconds:
    tv->tv_usec = M*tv->tv_usec - M*timezero->tv_usec + N*timezero->tv_usec;
    // Add the modulus of seconds to microseconds:
    tv->tv_usec += ((tv->tv_sec % N) * 1000000);
    tv->tv_sec /= N;
    tv->tv_usec /= N;
    }
    while(tv->tv_usec >= 1000000)
    {
        tv->tv_usec -= 1000000;
        tv->tv_sec += 1;
    }
    while(tv->tv_usec < 0)
    {
        tv->tv_usec += 1000000;
        tv->tv_sec -= 1;
    }
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