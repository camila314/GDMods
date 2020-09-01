main:
	nasm -fmacho64 -i/users/jakrillis/asminclude cocos.asm
	ar -rc libgdstdlib.a cocos.o
	rm cocos.o
release:
	cp libgdstdlib.a /usr/local/lib/libgdstdlib.a
	cp gdstdlib.hpp /usr/local/include/gdstdlib.hpp