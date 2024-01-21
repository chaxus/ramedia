#!/bin/bash -x

EMSDK=$PWD/emsdk/emsdk

$EMSDK install latest

$EMSDK activate latest

source $EMSDK/emsdk_env.sh


#!/bin/bash -x

# verify Emscripten version
emcc -v

# configure FFMpeg with Emscripten
# CFLAGS="-sPROXY_TO_PTHREAD"
CFLAGS="-sUSE_PTHREADS"
# CFLAGS="-s USE_PTHREADS -03"
LDFLAGS="$CFLAGS-sINITIAL_MEMORY=33554432" # 33554432 bytes = 32 MB
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
    # disable programs build (incl. ffplay, ffprobe & ffmpeg)
    --disable-programs
    # disable doc
    --disable-doc
    # --extra-cflags="$CFLAGS"
    # --extra-cxxflags="$CFLAGS"
    # --extra-ldflags="$LDFLAGS"
    --nm="$EMSDK/upstream/bin/llvm-nm"
    --ar=emar
    --ranlib=emranlib
    # --cc=emcc
    # --cxx=em++
    # --objcc=emcc
    # --dep-cc=emcc
)

CONFIG_ARGS="${FLAGS[@]}"

emconfigure ./configure $CONFIG_ARGS

# build dependencies
# make -j
emmake make -j

# # build ffmpeg.wasm
# mkdir -p wasm/dist

# ARGS=(
#     -I. -I./fftools
#     -Llibavcodec -Llibavdevice -Llibavfilter -Llibavformat -Llibavresample -Llibavutil -Llibpostproc -Llibswscale -Llibswresample
#     -Qunused-arguments
#     -o wasm/dist/ffmpeg.js fftools/ffmpeg_opt.c fftools/ffmpeg_filter.c fftools/ffmpeg_hw.c fftools/cmdutils.c fftools/ffmpeg.c
#     -lavdevice -lavfilter -lavformat -lavcodec -lswresample -lswscale -lavutil -lm
#     use SDL2
#     -s USE_SDL=2
#     # enable pthreads support
#     -s USE_PTHREADS=1
#     # 33554432 bytes = 32 MB
#     -s INITIAL_MEMORY=33554432
#     )

# EMCC_CONFIG="${ARGS[@]}"

# # make install
# emcc $EMCC_CONFIG




