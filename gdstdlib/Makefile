main:
	nasm -fmacho64 cocos.asm
	ar -rc libCacao.a cocos.o
	rm cocos.o
release:
	cp libCacao.a /Users/jakrillis/projects/gdmods/img/Cacao/static/libCacao.a