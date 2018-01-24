# WZAttributedStringChain

对 NSAttributedString 的封装，支持链式编程。

#### 安装

pod 'WZAttributedStringChain'

#### 使用方法

```objective-c
NSString *str1 = @"测试1", *str2 = @"测试2", *str3 = @"测试3";

// NSAttributedString(WZAttributeChain)
label.attributedText =
str1.attributedString.attributes(^(WZAttributesBuilder *builder) {
	builder.font = [UIFont systemFontOfSize:26];
	builder.foregroundColor = [UIColor redColor];
}).append(str2.attributedString.range(0, 2).attributes(^(WZAttributesBuilder *builder) {
	builder.foregroundColor = [UIColor yellowColor];
	builder.backgroundColor = [UIColor lightGrayColor];
})).append(str3.attributedString.attributes(^(WZAttributesBuilder *builder) {
	builder.foregroundColor = [UIColor blueColor];
	builder.writeDirection = WZAttributedWriteDirectionRLO;
}));

// NSMutableAttributedString(WZAttributeChain)
NSString *str = [NSString stringWithFormat:@"%@%@%@", str1, str2, str3];
label.attributedText =
str.mutableAttributedString.range(0, 3).attributes(^(WZAttributesBuilder *builder) {
	builder.font = [UIFont systemFontOfSize:26];
	builder.foregroundColor = [UIColor redColor];
}).range(3, 2).attributes(^(WZAttributesBuilder *builder) {
	builder.foregroundColor = [UIColor yellowColor];
	builder.backgroundColor = [UIColor lightGrayColor];
}).range(6, 3).attributes(^(WZAttributesBuilder *builder) {
	builder.foregroundColor = [UIColor blueColor];
	builder.writeDirection = WZAttributedWriteDirectionRLO;
});
```