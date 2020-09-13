main:
	nasm -fmacho64 mapasm.asm -I/Users/jakrillis/asminclude
	g++ mapasm.o mapper.cpp -std=c++11 -lGDML -dynamiclib -o map.dylib