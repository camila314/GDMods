cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

project(CacTemplate VERSION 0.1.0 LANGUAGES C CXX)

set(CACAO_COMPILE_STATIC yeah)
set(SOURCE_FILES main.mm)
include(Cacao/cmake/CacaoRoot.cmake)

add_library(Sex STATIC objcshit.m)
target_link_libraries(Sex "-framework Cocoa")


target_link_libraries(CacTemplate Sex "-framework OpenGL")