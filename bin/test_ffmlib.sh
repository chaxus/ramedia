PATH=$PWD
# echo $PATH
clang++ -I $PWD/ffmlib/include $PWD/test/ffmpeg_test.cpp -o $PWD/test/ffmpeg_test -L $PWD/ffmlib/lib/ -lavcodec -lavdevice -lavfilter -lavformat -lavutil