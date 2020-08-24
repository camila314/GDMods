main:
	nasm -fmacho64 gui.asm -i/Users/jakrillis/asminclude
	g++ main.mm gui.o -dynamiclib -lGDML -o main.dylib -std=c++11 -framework Cocoa