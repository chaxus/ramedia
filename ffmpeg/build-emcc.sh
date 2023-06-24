#!/bin/bash -x

# verify Emscripten version
emcc -v

# configure FFMpeg with Emscripten
CFLAGS="-s USE_PTHREADS -03"
LDFLAGS="$CFLAGS -s INITIAL_MEMORY=33554432" # 33554432 bytes = 32 MB
EMSDK=$(dirname $PWD)/emsdk

# configure FFMpeg with Emscripten
FLAGS=(
    # use none to prevent any os specific configurations
    --target-os=none
    # use x86_32 to achieve minimal architectural optimization
    --arch=x86_32
    # enable cross compile
    --enable-cross-compile
    # disable x86 asm
    --disable-x86asm
    # disable inline asm
    --disable-inline-asm
    # disable stripping
    --disable-stripping
    --extra-cflags="$CFLAGS"
    --extra-cxxflags="$CFLAGS"
    --extra-ldflags="$LDFLAGS"
    --nm="$EMSDK/upstream/bin/llvm-nm"
    --ar=emar
    --ranlib=emranlib
    --cc=emcc
    --cxx=em++
    --objcc=emcc
    --dep-cc=emcc
)
ARGS="${FLAGS[@]}"

emconfigure ./configure $ARGS

make -j

make install
