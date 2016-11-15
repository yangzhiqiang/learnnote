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