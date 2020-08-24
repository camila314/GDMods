main:
	nasm -i/Users/jakrillis/asminclude -fmacho64 gui.asm
	g++ gui.o main.mm -lGDML -std=c++11 -framework Cocoa -dynamiclib -o out.dylib