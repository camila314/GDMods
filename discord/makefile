main:
	nasm -i/users/jakrillis/asminclude -fmacho64 hook.asm
	gcc hook.o other.m -g -framework Cocoa -lMKit -dynamiclib -o disc.dylib