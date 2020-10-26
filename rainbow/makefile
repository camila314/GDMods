main:
	#nasm -fmacho64 switch.asm -i/Users/jakrillis/asminclude
	gcc hsv.m -c -o hsv.o
	colorgcc main.cpp hsv.o -std=c++11 -lstdc++ -lc++ -lgdstdlib -lGDML -g -dynamiclib -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -o rainb.dylib -framework CoreFoundation -framework AppKit -lSystem -static 
asm:
	colorgcc main.cpp -std=c++11 -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -S