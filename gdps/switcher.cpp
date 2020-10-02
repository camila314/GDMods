#include <gdstdlib.hpp>
#include <GDML/GDML.hpp>
#include <CoreFoundation/CoreFoundation.h>

#include <iostream>
#include <string>

#include <string>
#include <cstring>
#include <unordered_map>

#include <regex>

EventLoop* main;
std::string* outurl;

void switchPs(char const* url, char const* name) {
	GameManager::sharedState()->doQuickSave();


	long* accman = (long*)(getBase()+0x69c698);
	*accman = 0;

	strcpy((char*)getBase()+0x5204dc, name);
	auto manager = GameManager::sharedState();

	//delete manager;
	manager = GameManager::sharedState();

	manager->load();
	manager->reloadAll(false,false,true);
	manager->doQuickSave();
	manager->accountStatusChanged();

	outurl->assign(url);
}

void reload(std::string unneeded) {
	std::string file(unneeded.substr(0, unneeded.find(":")));
	std::string url(unneeded.substr(unneeded.find(":")+1, unneeded.length()));
	printf("its yeah %s\n", file.c_str());

	if(file!="CCGameManager.dat") {
		file = std::string("GDProfiles/")+file;
	}

	switchPs(url.c_str(),file.c_str());
}

extern "C" {
long hookfunc = 1;
void httpHook();

void sendHttp(void* inst, cocos2d::extension::CCHttpRequest* req) {

	std::string url(req->getUrl());
	url = std::regex_replace(url, std::regex("www\\.boomlings\\.com\\/database"), *outurl);
	req->setUrl(url.c_str());

	//std::cout<<"we doing an http url is " << req->getUrl() <<std::endl;
	return;// FCAST(sendHttp, main->container->getOriginal(getBase()+0x23e400))(inst, req);
}
}

static CFDataRef Callback(CFMessagePortRef port,
						  SInt32 messageID,
						  CFDataRef data,
						  void *info) {

	if(!CFDataGetLength(data))
		return NULL;

	std::string cdata(reinterpret_cast<char const*>(CFDataGetBytePtr(data)));

	cdata.resize(CFDataGetLength(data));

	printf("%s\n", reinterpret_cast<char const*>(CFDataGetBytePtr(data)));

	switch(messageID) {
		case 7: // add object
			main->dispatch_main(reload, cdata);
			break;
	}
	return NULL;
}

void initIPC() {
	CFMessagePortRef localPort = CFMessagePortCreateLocal(NULL,
								 CFSTR("314GDL"),
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

	outurl = new std::string("boomlings.com/database");

	hookfunc = getBase()+0x23db50;
	main = EventLoop::sharedState();

	main->container->registerWrite(getBase()+0x5204dc, 18, "CCGameManager.dat");

	main->container->registerHook(getBase()+0x23e400, (func_t)httpHook);

	main->start();

	initIPC();
}