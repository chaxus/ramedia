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
