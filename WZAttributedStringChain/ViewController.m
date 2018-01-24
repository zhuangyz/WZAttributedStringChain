//
//  ViewController.m
//  WZAttributedStringChain
//
//  Created by Walker on 2018/1/24.
//  Copyright © 2018年 wz. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+WZAttributeChain.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *attributedLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.attributedLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.attributedLabel.clipsToBounds = YES;
    self.attributedLabel.layer.borderWidth = 0.5;
}

- (IBAction)attributeChainTest:(UIButton *)sender {
    NSString *str = @"测试0测试2测试3";
    self.attributedLabel.attributedText =
    str.attributedString.range(0, 3).attributes(^(WZAttributesBuilder *builder) {
        builder.font = [UIFont systemFontOfSize:26];
        builder.foregroundColor = [UIColor redColor];
    }).range(3, 2).attributes(^(WZAttributesBuilder *builder) {
        builder.foregroundColor = [UIColor yellowColor];
        builder.backgroundColor = [UIColor lightGrayColor];
    }).range(6, 3).attributes(^(WZAttributesBuilder *builder) {
        builder.foregroundColor = [UIColor blueColor];
        builder.writeDirection = WZAttributedWriteDirectionRLO;
    });
}

- (IBAction)mutableAttributeChainTest:(UIButton *)sender {
    NSString *str = @"测试3测试2测试3";
    self.attributedLabel.attributedText =
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
}

- (IBAction)nativeAttributeTest:(UIButton *)sender {
    NSString *str = @"测试6测试2测试3";
    NSMutableAttributedString *mutableAttrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [mutableAttrStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:26],
                                    NSForegroundColorAttributeName:[UIColor redColor]}
                            range:NSMakeRange(0, 3)];
    [mutableAttrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor yellowColor],
                                    NSBackgroundColorAttributeName:[UIColor lightGrayColor]}
                            range:NSMakeRange(3, 2)];
    [mutableAttrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor],
                                    NSWritingDirectionAttributeName:@[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)]}
                            range:NSMakeRange(6, 3)];
    self.attributedLabel.attributedText = mutableAttrStr;
}

- (IBAction)appendAttributedStringTest:(UIButton *)sender {
    NSString *str1 = @"测试9", *str2 = @"测试2", *str3 = @"测试3";
    self.attributedLabel.attributedText =
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
}

@end




















