// extern 暗示这个函数可能在别的源文件里定义, 这样一来就是，在程序中取代include “*.h”来声明函数
// 在一些复杂的项目中，比较习惯在所有的函数声明前添加 extern 修饰，以防止遗漏包含头文件而导致的编译错误。
// 如果在函数定义的地方带有关键字extern，表示该函数会提供给外部文件使用，其实有些编译器是默认每个函数都是extern类型的，反之是static类型
extern void hello(const char *string);

#define MAX(a, b)((a) > (b) ? (a) : (b))