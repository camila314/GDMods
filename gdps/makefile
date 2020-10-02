main:
	nasm -fmacho64 switch.asm -i/Users/jakrillis/asminclude
	colorgcc switcher.cpp switch.o -std=c++11 -lc++ -lstdc++ -lgdstdlib -lGDML -framework CoreFoundation -g -dynamiclib -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -lSystem -static -o out.dylib
asm:
	colorgcc switcher.cpp -std=c++11 -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -S