#include <MKit.h>
#include <iostream>
#include <vector>
#include <sstream>
//#include <cpr/cpr.h>
#include <curl/curl.h>

size_t writeFunction(void *ptr, size_t size, size_t nmemb, std::string* data) {
    data->append((char*) ptr, size * nmemb);
    return size * nmemb;
}

void doTheHttp(char const* url, std::string& response_string) {
    auto curl = curl_easy_init();
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 1L);
        curl_easy_setopt(curl, CURLOPT_MAXREDIRS, 50L);
        curl_easy_setopt(curl, CURLOPT_TCP_KEEPALIVE, 1L);

        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0);
        
        std::string header_string;
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writeFunction);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &response_string);
        curl_easy_setopt(curl, CURLOPT_HEADERDATA, &header_string);
        
        char* url;
        long response_code;
        double elapsed;
        curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &response_code);
        curl_easy_getinfo(curl, CURLINFO_TOTAL_TIME, &elapsed);
        curl_easy_getinfo(curl, CURLINFO_EFFECTIVE_URL, &url);
        
        curl_easy_perform(curl);
        curl_easy_cleanup(curl);
        curl = NULL;
    }
}

std::vector<std::string> explode(std::string token, std::string str){
    std::vector<std::string>result;
    while(str.size()){
        int index = str.find(token);
        if(index!=std::string::npos){
            result.push_back(str.substr(0,index));
            str = str.substr(index+token.size());
            if(str.size()==0)result.push_back(str);
        }else{
            result.push_back(str);
            str = "";
        }
    }
    return result;
}

void replaceAll(std::string& str, const std::string& from, const std::string& to) {
    if(from.empty())
        return;
    size_t start_pos = 0;
    while((start_pos = str.find(from, start_pos)) != std::string::npos) {
        str.replace(start_pos, from.length(), to);
        start_pos += to.length(); // In case 'to' contains 'from', like replacing 'x' with 'yx'
    }
}

extern "C" {
extern void* callback();

long base;

void* (*original2)(void *, std::string*, std::string, std::string, long);

char const* getHTML(char const* sid) {

	std::string listenurl("https://www.newgrounds.com/audio/listen/");
	listenurl += sid;

	//cpr::Response r = cpr::Get(cpr::Url{"https://www.newgrounds.com/audio/listen/1"});


	std::string songinfo("-1");
	
	doTheHttp(listenurl.c_str(), songinfo);

	if (songinfo.find("author") == std::string::npos)
		return "-2";

	std::string songid(sid); //explode("\" title", explode("o/download/",songinfo)[1])[0] );
	std::string songurl( explode("\",\"", explode("\"url\":\"", songinfo)[1])[0] );
	std::string songauthor( explode("\",\"", explode("artist\":\"", songinfo)[1])[0] );
	std::string songname( explode("<title>", explode("</title>", songinfo)[0])[1] );
	replaceAll(songurl, "\\/", "/");

	if(songurl.empty())
		return "-2";
	std::string result("1~|~");

	result += songid+"~|~2~|~"+songname+"~|~3~|~1234~|~4~|~"+songauthor+"~|~5~|~6.69~|~6~|~~|~10~|~"+songurl+"~|~7~|~~|~8~|~1";
	char* ret = (char*)malloc(sizeof(char)*300);
	strcpy(ret, result.c_str());
	return ret;

}

void inject() {
	base=baseAddress();
	char* text = "Song is Newgrounds banned.";
	writeProcessMemory(baseAddress()+0x54be86, 27, text);
	rd_route(reinterpret_cast<void*>(baseAddress()+0x2eec60), reinterpret_cast<void*>(callback), (void**)&original2);
}
}