main:
	#nasm -fmacho64 switch.asm -i/Users/jakrillis/asminclude
	colorgcc main.cpp -std=c++11 -lc++ -lGDML -lstdc++ -lgdstdlib -framework CoreFoundation -g -dynamiclib -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -lSystem -static -o main.dylib
asm:
	colorgcc main.cpp -std=c++11 -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -S