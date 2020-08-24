#include <MKit.h>
#include <iostream>

extern "C" {
void (*load_og)(void*, long);
void (*btnOrig)(void*);

void* (*sharedState)();
void* (*updateFrame)(void*, int, int);
long base;
extern void btn(void);
extern void popup(void*);
struct v {
	int cube;
	int ship;
	int ball;
	int ufo;
	int robot;
	int spider;
} vehicles;

struct c {
	int c1;
	int c2;
} colors;

struct v_2 {
	int cube;
	int pad1;
	int cube2;

	int ship;
	int pad2;
	int ship2;

	int ball;
	int pad3;
	int ball2;

	int ufo;
	int pad4;
	int ufo2;

	int robot;
	int pad5;
	int robot2;

	//int spider;
	//int pad6;
	//int spider2;
};

struct spid {
	int spid;
	int pad;
	int spid2;
};
struct c_2 {
	int col1;
	int pad1;
	int col12;

	int col2;
	int pad2;
	int col22;
};
void sett(void* instance, long stats) {

	//fprintf(tty(),"%d\n",vehicles.cube);
	load_og(instance,stats);
}

void onCopy(void* profilePage) {
	//fprintf(tty(),"%llx\n",profilePage);
	//get shared state
	long state = reinterpret_cast<long>(sharedState()); // +0x208 = cube, +0x0x214 = ship

	// do the popup
	popup(profilePage);

	//get the icons
	long stats = *reinterpret_cast<long*>((long)profilePage+0x288);
	memcpy(&vehicles, reinterpret_cast<const void*>(stats+0x190), sizeof(vehicles));
	memcpy(&colors, reinterpret_cast<const void*>(stats+0x15c), sizeof(colors));
	//fprintf(tty(),"%d\n",vehicles.spider);
	//save icons
	v_2 icons = {.cube=vehicles.cube, .pad1 = 0, .cube2 = vehicles.cube,
				 .ship=vehicles.ship, .pad2 = 0, .ship2 = vehicles.ship,
				 .ball=vehicles.ball, .pad3 = 0, .ball2 = vehicles.ball,
				 .ufo=vehicles.ufo, .pad4 = 0, .ufo2 = vehicles.ufo,
				 .robot=vehicles.robot, .pad5 = 0, .robot2 = vehicles.robot,
				 //.spider=vehicles.spider, .pad6 = 0, .spider2=vehicles.spider
				};
	c_2 cols= {.col1=colors.c1, .pad1=0, .col12=colors.c1,
			   .col2=colors.c2, .pad2=0, .col22=colors.c2};

	spid sp = {.spid=vehicles.spider, .pad=0, .spid2=vehicles.spider};

	//fprintf(tty(),"the spider %d\n",sp.spid);
	memcpy(reinterpret_cast<void*>(state+0x200),&icons, sizeof(icons));
	memcpy(reinterpret_cast<void*>(state+0x248),&sp, sizeof(sp));

	memcpy(reinterpret_cast<void*>(state+0x254),&cols, sizeof(cols));

	//updateFrame(*reinterpret_cast<void**>(state+0x1a0), vehicles.cube, 1);
	//create(0,0.5,0.6)
}

void install(void) __attribute__((constructor));
void install(void) {
	base = baseAddress();
	//fprintf(tty(),"%s\n","engaged in stealer");

	sharedState = reinterpret_cast<void *(*)()>(base+0x1c2b30);
	updateFrame = reinterpret_cast<void *(*)(void *, int, int)>(base+0x1b62f0);

	rd_route(reinterpret_cast<void*>(baseAddress()+0x461158), reinterpret_cast<void*>(btn), (void**)&btnOrig);

	//rd_route(reinterpret_cast<void*>(baseAddress()+0x460480), reinterpret_cast<void*>(sett), (void**)&load_og);

	char byte = 0xeb;
	writeProcessMemory(baseAddress()+0x461147, 1, &byte);
	char nops[2] = {0x90,0x90};
	writeProcessMemory(baseAddress()+0x461139, 2, nops);
}

}
