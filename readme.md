# C++

如果要为 macOS 进行 C++ 开发，建议安装 Clang 编译器。只需在“终端”窗口(Ctrl+Shift+ `)中运行以下命令即可安装命令行开发人员工具:

xcode-select --install

然后，要验证已安装 clang，请在“终端”窗口中运行以下命令。你应该会看到一条消息，其中包含有关所使用的 Clang 版本的信息。

clang --version

```c++
#include<iostream>

using namespace std;

int main(){
    cout << "Hello~" << endl;
    return 0;
}

```
命令行执行：
```sh
clang++ main.cpp 
./a.out 
```

# WebAssembly

官网：https://emscripten.org/

Mac 安装 `Emscripten`

```sh
brew install emscripten
```

安装完成后测试是否存在

```sh
emcc -v
```
编译 `C++` 代码
```sh
emcc main.cpp
```
命令成功执行后，你会发现 `main.cpp` 同级目录下会生成两个文件：`a.out.wasm` 和 `a.out.js`。其中，`a.out.wasm` 就是我们想要的 `Wasm` 模块。



# FFmpeg

官方地址：http://ffmpeg.org 

原文链接：https://itnext.io/build-ffmpeg-webassembly-version-ffmpeg-js-part-1-preparation-ed12bf4c8fac

为什么要构建 `FFmpeg` 呢？

1. `FFmpeg` 是一个免费的开源项目，由一套庞大的软件库和程序组成，用于处理视频、音频、其他多媒体文件和流。

2. 它非常有用，而且没有一个 `JavaScript` 库具有完全相同的功能。和它最像的是 [ffmpeg.js](https://github.com/Kagami/ffmpeg.js) 和 [videoconverter.js](https://github.com/bgrins/videoconverter.js)。但他们的 `FFmpeg` 和 `Emscripten` 都已经过时了，并且多年来没有维护了。（目前 `FFmpeg` 版本为 `6.0`, `Emscripten` 为 `3.1.42`）

## 一.构建原生 FFmpeg

构建和安装FFmpeg的说明可以在版本库根目录下的 `INSTALL.md` 中找到。

```sh
#!/bin/bash -x
# "nasm/yasm not found or too old. Use --disable-x86asm for a crippled build."
./configure --prefix=$(dirname $PWD)/ffmlib --enable-static --enable-shared --disable-doc
make -j
make install
```

构建后目录如下：

```
.
├── bin
│   ├── ffmpeg
│   └── ffprobe
├── include
│   ├── libavcodec
│   │   ├── ac3_parser.h
│   │   ├── adts_parser.h
│   │   ├── avcodec.h
│   │   ├── avdct.h
│   │   ├── avfft.h
│   │   ├── d3d11va.h
│   │   ├── dirac.h
│   │   ├── dv_profile.h
│   │   ├── dxva2.h
│   │   ├── jni.h
│   │   ├── mediacodec.h
│   │   ├── qsv.h
│   │   ├── vaapi.h
│   │   ├── vdpau.h
│   │   ├── version.h
│   │   ├── videotoolbox.h
│   │   ├── vorbis_parser.h
│   │   └── xvmc.h
│   ├── libavdevice
│   │   ├── avdevice.h
│   │   └── version.h
│   ├── libavfilter
│   │   ├── avfilter.h
│   │   ├── buffersink.h
│   │   ├── buffersrc.h
│   │   └── version.h
│   ├── libavformat
│   │   ├── avformat.h
│   │   ├── avio.h
│   │   └── version.h
│   ├── libavutil
│   │   ├── adler32.h
│   │   ├── aes_ctr.h
│   │   ├── aes.h
│   │   ├── attributes.h
│   │   ├── audio_fifo.h
│   │   ├── avassert.h
│   │   ├── avconfig.h
│   │   ├── avstring.h
│   │   ├── avutil.h
│   │   ├── base64.h
│   │   ├── blowfish.h
│   │   ├── bprint.h
│   │   ├── bswap.h
│   │   ├── buffer.h
│   │   ├── camellia.h
│   │   ├── cast5.h
│   │   ├── channel_layout.h
│   │   ├── common.h
│   │   ├── cpu.h
│   │   ├── crc.h
│   │   ├── des.h
│   │   ├── dict.h
│   │   ├── display.h
│   │   ├── downmix_info.h
│   │   ├── encryption_info.h
│   │   ├── error.h
│   │   ├── eval.h
│   │   ├── ffversion.h
│   │   ├── fifo.h
│   │   ├── file.h
│   │   ├── frame.h
│   │   ├── hash.h
│   │   ├── hmac.h
│   │   ├── hwcontext_cuda.h
│   │   ├── hwcontext_d3d11va.h
│   │   ├── hwcontext_drm.h
│   │   ├── hwcontext_dxva2.h
│   │   ├── hwcontext.h
│   │   ├── hwcontext_mediacodec.h
│   │   ├── hwcontext_qsv.h
│   │   ├── hwcontext_vaapi.h
│   │   ├── hwcontext_vdpau.h
│   │   ├── hwcontext_videotoolbox.h
│   │   ├── imgutils.h
│   │   ├── intfloat.h
│   │   ├── intreadwrite.h
│   │   ├── lfg.h
│   │   ├── log.h
│   │   ├── lzo.h
│   │   ├── macros.h
│   │   ├── mastering_display_metadata.h
│   │   ├── mathematics.h
│   │   ├── md5.h
│   │   ├── mem.h
│   │   ├── motion_vector.h
│   │   ├── murmur3.h
│   │   ├── opt.h
│   │   ├── parseutils.h
│   │   ├── pixdesc.h
│   │   ├── pixelutils.h
│   │   ├── pixfmt.h
│   │   ├── random_seed.h
│   │   ├── rational.h
│   │   ├── rc4.h
│   │   ├── replaygain.h
│   │   ├── ripemd.h
│   │   ├── samplefmt.h
│   │   ├── sha512.h
│   │   ├── sha.h
│   │   ├── spherical.h
│   │   ├── stereo3d.h
│   │   ├── tea.h
│   │   ├── threadmessage.h
│   │   ├── timecode.h
│   │   ├── time.h
│   │   ├── timestamp.h
│   │   ├── tree.h
│   │   ├── twofish.h
│   │   ├── version.h
│   │   └── xtea.h
│   ├── libswresample
│   │   ├── swresample.h
│   │   └── version.h
│   └── libswscale
│       ├── swscale.h
│       └── version.h
├── lib
│   ├── libavcodec.so -> libavcodec.so.58.18.100
│   ├── libavcodec.so.58 -> libavcodec.so.58.18.100
│   ├── libavcodec.so.58.18.100
│   ├── libavdevice.so -> libavdevice.so.58.3.100
│   ├── libavdevice.so.58 -> libavdevice.so.58.3.100
│   ├── libavdevice.so.58.3.100
│   ├── libavfilter.so -> libavfilter.so.7.16.100
│   ├── libavfilter.so.7 -> libavfilter.so.7.16.100
│   ├── libavfilter.so.7.16.100
│   ├── libavformat.so -> libavformat.so.58.12.100
│   ├── libavformat.so.58 -> libavformat.so.58.12.100
│   ├── libavformat.so.58.12.100
│   ├── libavutil.so -> libavutil.so.56.14.100
│   ├── libavutil.so.56 -> libavutil.so.56.14.100
│   ├── libavutil.so.56.14.100
│   ├── libswresample.so -> libswresample.so.3.1.100
│   ├── libswresample.so.3 -> libswresample.so.3.1.100
│   ├── libswresample.so.3.1.100
│   ├── libswscale.so -> libswscale.so.5.1.100
│   ├── libswscale.so.5 -> libswscale.so.5.1.100
│   ├── libswscale.so.5.1.100
│   └── pkgconfig
│       ├── libavcodec.pc
│       ├── libavdevice.pc
│       ├── libavfilter.pc
│       ├── libavformat.pc
│       ├── libavutil.pc
│       ├── libswresample.pc
│       └── libswscale.pc
└── share
    └── ffmpeg
        ├── examples
        │   ├── avio_dir_cmd.c
        │   ├── avio_reading.c
        │   ├── decode_audio.c
        │   ├── decode_video.c
        │   ├── demuxing_decoding.c
        │   ├── encode_audio.c
        │   ├── encode_video.c
        │   ├── extract_mvs.c
        │   ├── filter_audio.c
        │   ├── filtering_audio.c
        │   ├── filtering_video.c
        │   ├── http_multiclient.c
        │   ├── hw_decode.c
        │   ├── Makefile
        │   ├── metadata.c
        │   ├── muxing.c
        │   ├── qsvdec.c
        │   ├── README
        │   ├── remuxing.c
        │   ├── resampling_audio.c
        │   ├── scaling_video.c
        │   ├── transcode_aac.c
        │   ├── transcoding.c
        │   ├── vaapi_encode.c
        │   └── vaapi_transcode.c
        ├── ffprobe.xsd
        ├── libvpx-1080p50_60.ffpreset
        ├── libvpx-1080p.ffpreset
        ├── libvpx-360p.ffpreset
        ├── libvpx-720p50_60.ffpreset
        └── libvpx-720p.ffpreset
```

- ' libavcodec '提供更广泛的编解码器的实现。
- ' libavformat '实现流协议，容器格式和基本I/O访问。
- ' libavutil '包含哈希器、解压缩器和各种实用函数。
- ' libavfilter '提供了通过连接过滤器的有向图来改变解码音频和视频的方法。
- ' libavdevice '提供了一个抽象来访问捕获和回放设备。
- ' libswresample '实现音频混合和重采样例程。
- ' libswscale '实现颜色转换和缩放例程。
