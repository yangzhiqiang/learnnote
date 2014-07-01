### Swift中使用Objective-C的动态库

前一段时间做了一个Objective-C的动态库，Swift出来后，看到可以继续使用Objective-C编写的代码，所以想做一个尝试，记录一下发现的问题，及修正的方法。

1. 与在Objective-C工程中一些样，把自己的库文件添加到项目中，包括头文件和.a文件等。或者直接添加Framework到项目中，
2. 添加一个BridgeHeader，随便命名，一般命名方式为`AppName-Bridging-Header.h`，然后把你要用到的头文件导入到文件中。`#import "MyLibraryHeader.h"`
3. 在Build Setting的Swift Compiler中选项中，设定`Objective-C bridge header`为第2步中添加的头文件。
4. 接下来就可以在任何工程的Swift文件中使用库里面的类型和函数了，不用使用swift的`import XXX`来导入相应的内容。
