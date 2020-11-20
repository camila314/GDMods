// Copyright 2020 camden314©
#include <CoreFoundation/CoreFoundation.h>
#include <gdstdlib.hpp>
ModContainer* maint;

cocos2d::_ccColor3B col1 = {255, 255, 255};
cocos2d::_ccColor3B col2 = {255, 255, 255};

cocos2d::_ccColor3B custrgb(void* inst, int index) {
    if(index == 69420) {
        return col1;
    } else if(index == 42069) {
        return col2;
    } else {
        return FCAST(custrgb, maint->getOriginal(getBase()+0x1cbc80))(inst, index);
    }
}

static CFDataRef Callback(CFMessagePortRef port,
                          SInt32 messageID,
                          CFDataRef data,
                          void *info) {
    printf("poggers\n");
    if(messageID == 1) {
        CFDataGetBytes(data, CFRangeMake(0,CFDataGetLength(data)), (UInt8*)&col1);
    } else if(messageID==2) {
        CFDataGetBytes(data, CFRangeMake(0,CFDataGetLength(data)), (UInt8*)&col2);
    } else {
        return CFDataCreate(NULL, (const UInt8*)"ok", 3);
    }
    GameManager::sharedState()->setFirstColorIdx(69420);
    GameManager::sharedState()->setSecondColorIdx(42069);
    return CFDataCreate(NULL, (const UInt8*)"ok", 3);
}
void initIPC() {
    CFMessagePortRef localPort = CFMessagePortCreateLocal(NULL,
                                 CFSTR("gdRgb"),
                                 Callback,
                                 NULL,
                                 NULL);
    CFRunLoopSourceRef runLoopSource = CFMessagePortCreateRunLoopSource(NULL, localPort, 0);

    CFRunLoopAddSource(CFRunLoopGetCurrent(),
                       runLoopSource,
                       kCFRunLoopCommonModes);
    CFRunLoopRun();
    CFRelease(localPort);
}
void inject() {

    maint = new ModContainer("yeye", "global");

    maint->registerHook(getBase()+0x1cbc80, (func_t)custrgb);

    maint->enable();

    initIPC();
    printf("im trying\n");
}