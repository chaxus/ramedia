#!/bin/bash -x

# verify Emscripten version
emcc -v

# configure FFMpeg with Emscripten
CFLAGS="-s USE_PTHREADS"
LDFLAGS="$CFLAGS -s INITIAL_MEMORY=33554432" # 33554432 bytes = 32 MB

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
  --nm="llvm-nm"
  --ar=emar
  --ranlib=emranlib
  --cc=emcc
  --cxx=em++
  --objcc=emcc
  --dep-cc=emcc
)
echo "${FLAGS[@]}"
# emconfigure ./configure "${FLAGS[@]}"
emconfigure ./configure --cc="emcc" --cxx="em++" --ar="emar" --ranlib=emranlib --prefix=$(pwd)/dist --enable-cross-compile --target-os=none --arch=x86_64 --cpu=generic --disable-ffplay --disable-ffprobe --disable-asm --disable-doc --disable-devices --disable-indevs --disable-outdevs --disable-network --disable-w32threads --disable-pthreads --enable-ffmpeg --enable-static --disable-shared --enable-decoder=pcm_mulaw --enable-decoder=pcm_alaw --enable-decoder=adpcm_ima_smjpeg --enable-decoder=aac --enable-decoder=hevc --enable-decoder=h264 --enable-protocol=file --disable-stripping

