#!/bin/bash -x
# "nasm/yasm not found or too old. Use --disable-x86asm for a crippled build."
./configure --disable-x86asm --prefix=$PWD/dist --enable-static --enable-shared
make -j
make install