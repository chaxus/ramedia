#!/bin/bash -x

EMSDK=$PWD/emsdk/emsdk

$EMSDK install latest

$EMSDK activate latest

source $EMSDK/emsdk_env.sh

