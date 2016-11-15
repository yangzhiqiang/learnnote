### Swift中使用Objective-C的动态库

前一段时间做了一个Objective-C的动态库，Swift出来后，看到可以继续使用Objective-C编写的代码，所以想做一个尝试，记录一下发现的问题，及修正的方法。

1. 如何使用动态库。
	
	与在Objective-C工程中一些样，把自己的库文件添加到项目中，包括头文件和.a文件等。或者直接添加Framework到项目中，
2. 如何导入OC文件

	* 添加一个BridgeHeader，随便命名，一般命名方式为`AppName-Bridging-Header.h`，然后把你要用到的头文件导入到文件中。`#import "MyLibraryHeader.h"`
	
	* 在Build Setting的Swift Compiler中选项中，设定`Objective-C bridge header`为第2步中添加的头文件。
	* 接下来就可以在任何工程的Swift文件中使用库里面的类型和函数了，不用使用swift的`import XXX`来导入相应的内容。
3. 如何在Swift中使用在OC中定义的NS_OPTIONS，
	
	`
	typedef NS_OPTIONS(NSInteger, MCOIMAPMessagesRequestKind) {
		MCOIMAPMessagesRequestKindUid = 0,
	   MCOIMAPMessagesRequestKindFlags          = 1 << 0,
	   MCOIMAPMessagesRequestKindHeaders        = 1 << 1,
   		MCOIMAPMessagesRequestKindStructure      = 1 << 2,
	};
	`
	* 单个使用时，单独调用相应的值即可。
		`let kind : MCOIMAPMessagesRequestKind = .header`
	* 当需要组合时，即选项或在一起时。使用如下形式。
		* `let kind : MCOIMAPMessagesRequestKind = [.headers,.structure]`
		* `let kind = MCOIMAPMessagesRequestKind([.headers,.structure]`