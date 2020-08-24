main:
	nasm -fmacho64 gui.asm
	gcc main.c gui.o -lMKit -dynamiclib -o noclip.dylib
clean:
	rm *.o noclip.dylib