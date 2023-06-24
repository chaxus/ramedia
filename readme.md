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



# video

`ffmpeg` 地址：http://ffmpeg.org 