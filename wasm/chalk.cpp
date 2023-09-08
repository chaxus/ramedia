#include <iostream>  
  
/**
 * @description: 读取输入的参数
 * int argc：这是命令行参数的数量。
 * 这些参数通常是你从命令行启动程序时提供的。
 * 例如，如果你在命令行上键入 myprogram arg1 arg2，那么 argc 将会是 3
 * 因为你有三个参数（程序名加上两个额外的参数）。
 * 
 * char **argv：这是一个指针的数组，包含所有的命令行参数。
 * argv[0] 通常是程序的名称，argv[1] 是第一个命令行参数，以此类推。
 * 每个参数都是一个字符串。
 * 
 * @param {int} argc
 * @param {char} *
 * @return {*}
 */
int main(int argc, char **argv) {  
    for (int i = 0; i < argc; ++i) {  
        std::cout << argv[i] << std::endl;  
    }  
    return 0;  
}