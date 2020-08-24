#import <Cocoa/Cocoa.h>
#include "mypng.h"
#include "myplist.h"
#include <stdlib.h>
#include <MKit.h>

enum EImageFormat {
  kFmtJpg = 0, kFmtPng, kFmtTiff, kFmtWebp,
  kFmtRawData, kFmtUnKnown
};

typedef void* CCImage;
typedef void* CCTexture;
typedef void* CCSprite;

char const* extractDiscordTag(char const* twitc) {
	NSString* twitch = [NSString stringWithUTF8String:twitc];

	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\?(.+)\\.(\\d{4})"
	                                                  options:NSRegularExpressionCaseInsensitive
	                                                  error:nil];
	NSArray *results=[regex matchesInString:twitch options:0 range:NSMakeRange(0, twitch.length)];

	NSTextCheckingResult* match = [results firstObject];

	NSRange matchRange = [match rangeAtIndex:1];

	NSString *username = [twitch substringWithRange:[match rangeAtIndex:1]];

	NSString *tag = [twitch substringWithRange:[match rangeAtIndex:2]];

	const char* str = [[NSString stringWithFormat:@"%@#%@", username, tag] UTF8String];

	if(*str != '#') {
		NSLog(@"bro what.");
		return str;
	} else {
		return NULL;
	}
}

extern void profileHook();
extern void popup(void* a);
extern char sexytag[];
void (*profileOg)();
long base;

void* (*opnew)(int);
void (*CCImagenew)(void*);
void (*CCTexturenew)(void*);
CCSprite (*CCSpritecreate)();

void* (*CCRectcreate)(void*, float,float,float,float);

void (*initWithImageData)(CCImage, void*, unsigned int, enum EImageFormat);
void (*initWithImage)(CCTexture, CCImage);
void (*initWithTexture)(CCSprite, CCTexture, void*);

void (*setTexture)(CCSprite, CCTexture);
float PeePee = 30.0;

long profileJmp;

void callback(void* a, void* b) {
	printf("%s\n", "callbac");
	popup(a);

	NSString* field = [NSString stringWithUTF8String:&sexytag];
	[[NSPasteboard generalPasteboard] clearContents];
	[[NSPasteboard generalPasteboard] setString:field forType:NSStringPboardType];
}

void* createSprite(/*CCSprite sprite*/) {
	CCImage img = opnew(0x40);
	CCImagenew(img);
	initWithImageData(img, &discord_png, discord_png_len, kFmtPng);

	CCTexture texture = opnew(0x58);
	CCTexturenew(texture);
	initWithImage(texture, img);

	unsigned char rect[0x30];
	CCRectcreate(&rect, 0.0,0.0,PeePee,PeePee);

	CCSprite sprite = CCSpritecreate();
	initWithTexture(sprite, texture, &rect);

	setTexture(sprite, texture);

	return sprite;


}
void inject(void) {
	base = baseAddress();

	CCRectcreate = base+0x137020;
	initWithImageData = base+0x24fcb0;
	initWithImage = base+0x246940;
	opnew = base+0x48a0c8;
	CCImagenew = base+0x24fa00;
	CCTexturenew = base+0x246280;
	CCSpritecreate = base+0x132df0;
	initWithTexture = base+0x1330f0;
	setTexture = base+0x135a90;

	extractDiscordTag("hi");
	rd_route(base+0x461055, profileHook, (void**)&profileOg);

	writeProcessMemory(base+0x5E09D, 2, "\x90\x90");
	writeProcessMemory(base+0x5E0a3, 1, "\xD1");

	profileJmp = base+0x46106C;

}