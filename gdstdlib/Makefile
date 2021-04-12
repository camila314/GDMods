main:
	nasm -fmacho64 cocos.asm
	ar -rc libCacao.a cocos.o
	rm cocos.o
release:
	cp libCacao.a /Users/jakrillis/projects/multithread/Cacao/static/libCacao.a