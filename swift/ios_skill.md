#iOS Skill

* 改变TextField的 placeHolder 文字颜色, 在属性设定中的 “User Defined Runtime Attributes” 中添加
`_placeholderLabel.textColor `，类型：`Color`, 值：想设定的值。或者在代码中写入下内容
`setValue(Color, forKey: "_placeholderLabel.textColor")`

* 如何改变 NavigationBar 上自定义图像的颜色

```
NSString *iconFilename = // ...
UIImage *image = 
    [[UIImage imageNamed:iconFilename] 
        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];        
UIBarButtonItem *barButtonItem = 
    [[UIBarButtonItem alloc] initWithImage:image
                                     style:UIBarButtonItemStylePlain 
                                    target:self 
                                    action:@selector(onBarButtonItemTapped:)];                                    
```

* 如何实现TextField在内容为空的情况下获取到删除键信息
	1. 在不为空的情况下，通过 delegate 的 
	 	`func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool` 
	 	方法来获取到，当string为空时，即收到了删除键。
	2. 当内容为空时，此时删除键按下时，并不调用上面的回调函数。此时要获取删除键需要生成UITextField子类，重载`deleteBackward`函数，来获取删除键信息。注意调用super的对应函数，否则删除键失效了，😂。

* 获取 Framework 版本信息
 
```
let bundle = Bundle(identifier: "com.sensoro.SensoroSensorKit")! // Get a reference to the bundle from your framework (not the bundle of the app itself!)
let build = bundle.infoDictionary![kCFBundleVersionKey as String] as! String // Get the build from the framework's bundle as a String
```
* 改变 UIAlertAction 字体

```
        let cancel = UIAlertAction(title: localString("CANCEL_TITLE"), style: .default) { alertAction in }
        if let btn = cancel.value(forKey: "__representer") as? NSObject, let label = btn.value(forKey: "label") as? UILabel {
            let attributesBtn : [NSAttributedStringKey : Any] = [
                NSAttributedStringKey.foregroundColor : ResourceManager.LIGHT_TEXT_COLOR,
                NSAttributedStringKey.font : ResourceManager.SMALL_FONT
            ];

            let attributedText = NSAttributedString(string: localString("CANCEL_TITLE"), attributes: attributesBtn)
            label.attributedText = attributedText
        }
```

* 改变 UIAlertAction 文字颜色
```
        let cancel = UIAlertAction(title: localString("CANCEL_TITLE"), style: .default) { alertAction in
            alert.dismiss(animated: true, completion: nil);
        }
        
        cancel.setValue(ResourceManager.LIGHT_TEXT_COLOR, forKey: "titleTextColor");
```