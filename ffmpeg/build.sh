#!/bin/bash -x
# "nasm/yasm not found or too old. Use --disable-x86asm for a crippled build."
./configure --prefix=$(dirname $PWD)/ffmlib --enable-static --enable-shared --disable-doc
make -j
make install
