main:
	nasm -fmacho64 playObjAsm.asm -i/users/jakrillis/asminclude
	colorgcc playObjAsm.o playObj.cpp -std=c++11 -lstdc++ -lc++ -lgdstdlib -lGDML -g -dynamiclib -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -o out.dylib
asm:
	colorgcc playObj.cpp -std=c++11 -I/usr/local/include/cocos2dx -I/usr/local/include/cocos2dext -S