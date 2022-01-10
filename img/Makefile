#customizable-kind of
CXX=g++
OUTPUT=dist/main.dylib

# no touch

LDFLAGS=-static-libstdc++
INCL=Cacao/include Cacao/include/cocos2dx Cacao/include/cocos2dx/include Cacao/include/cocos2dx/kazmath/include Cacao/include/cocos2dx/platform/mac Cacao/include/cocos2dx/platform/third_party/mac Cacao/include/cocos2dx/platform/third_party/mac/OGLES Cacao/include/cocos2dext Cacao/include/cocos2dx/custom/Sprites/CCMenuItemSpriteExtra
CXX_INCL=$(INCL:%=-I%)
CXX_FLAGS=-std=c++11 -DCC_TARGET_OS_MAC -lGDML -lCacao -LCacao/static -dynamiclib -lSystem -lstdc++ -static -g Cacao/include/Cacao.cpp -framework Cocoa -framework AVFoundation -framework CoreMedia -framework CoreVideo -isysroot /Users/jakrillis/projects/builds/MacOSX-SDKS/MacOSX10.7.sdk

main: dist
	@echo "Building project..."
	gcc export.m -mmacosx-version-min=10.7 -c
	@$(CXX) main.cpp export.o $(CXX_INCL) $(CXX_FLAGS) $(CXX_EXTRA) -o $(OUTPUT)
	@echo "Finished"
asm:
	@$(CXX) $(CXX_INCL) $(CXX_FLAGS) $(CXX_EXTRA) main.cpp -S
	mv main.s main.asm
dist:
	mkdir dist
clean: 
	-@rm -rf dist 2>/dev/null || true
inject:
	sudo osxinj "Geometry Dash" $(OUTPUT)