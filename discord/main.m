#import <Foundation/Foundation.h>
#include "mypng.h"
#include "myplist.h"
#include <stdlib.h>
#include <MKit.h>

char const* extractDiscordTag(char const* twitc) {
	NSError *error = NULL;
	NSString* twitch = [NSString stringWithUTF8String:twitc];

	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\/(.+?)\\.(\\d{4})\\/"
	                                                  options:NSRegularExpressionCaseInsensitive
	                                                  error:&error];
	NSArray *results=[regex matchesInString:twitch options:0 range:NSMakeRange(0, twitch.length)];

	NSTextCheckingResult* match = [results firstObject];

	NSRange matchRange = [match rangeAtIndex:1];

	NSString *username = [twitch substringWithRange:[match rangeAtIndex:1]];

	NSString *tag = [twitch substringWithRange:[match rangeAtIndex:2]];

	return [[NSString stringWithFormat:@"%@#%@", username, tag] UTF8String];
}

void callback(void* a, void* b) {
	printf("%s\n", "sexy");
}
extern void profileHook();
void (*profileOg)();
long base;


void* (*sharedTextureCache)();
void (*addImage)(void*, char const*, bool);

void* (*sharedSpriteFrameCache)();
void (*addSpriteFramesWithFile)(void*, char const*);
void inject() {
	NSLog(@"bro wtf");

	base = baseAddress();
	sharedTextureCache = base+0x356e00;
	addImage = base+0x358120;
	sharedSpriteFrameCache = base+0x198970;
	addSpriteFramesWithFile = base+0x199a10;


	NSString* documentsDir = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@".gdDisc"];
	
	BOOL isDir;
	NSFileManager *fileManager= [NSFileManager defaultManager]; 
	if(![fileManager fileExistsAtPath:documentsDir isDirectory:&isDir])
	    [fileManager createDirectoryAtPath:documentsDir withIntermediateDirectories:YES attributes:nil error:NULL];
	
	NSData* discPng = [NSData dataWithBytes:&discord_png length:discord_png_len];
	NSData* discPlist = [NSData dataWithBytes:&discord_plist length:discord_plist_len];

	NSString* spriteFile = [documentsDir stringByAppendingPathComponent:@"discord.plist"];
	NSString* spriteImage = [documentsDir stringByAppendingPathComponent:@"discord.png"];

	[discPng writeToFile:spriteImage options:NSDataWritingAtomic error:nil];
	[discPlist writeToFile:spriteFile options:NSDataWritingAtomic error:nil];


	NSLog(@"%@",documentsDir);

	/*void* sharedTexture = sharedTextureCache();

	addImage(sharedTexture, [spriteImage UTF8String], false);

	void* sharedFrameCache = sharedSpriteFrameCache();

	addSpriteFramesWithFile(sharedFrameCache, [spriteFile UTF8String]);*/


	rd_route(base+0x460480, profileHook, (void**)&profileOg);

	//fopen(discord_png,)
}