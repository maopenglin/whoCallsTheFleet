//
//  LScTPCalculatorViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScTPCalculatorViewController.h"

#import "LSvTPCalculatorView.h"
#import "LSvTPCalculatorCountView.h"

#import "LSmTPCalculatorCount.h"

#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface LScTPCalculatorViewController ()<TTTAttributedLabelDelegate>

@property (nonatomic, weak) LSvTPCalculatorView *TPCalculatorView;
//数据模型
@property (nonatomic, strong) NSMutableArray<LSmTPCalculatorCount *> *TPCalculatorCounts;

@end

@implementation LScTPCalculatorViewController

#pragma mark - 工厂方法

+ (instancetype)TPCalculatorViewController
{
    return [[self alloc] init];
}
- (instancetype)init
{
    if (self = [super init]) {
        //创建主体view
        LSvTPCalculatorView *TPCalculatorView = [LSvTPCalculatorView TPCalculatorView];
        self.TPCalculatorView = TPCalculatorView;
        [self.view addSubview:self.TPCalculatorView];
    }
    return self;
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //显示计算结果
    [self reloadCalculatorResult];
    
    /*** 添加countView ***/
    for (int i = 0; i < self.TPCalculatorCounts.count; ++i) {
        //计算frame
        CGFloat countViewW = CGRectGetWidth([UIScreen mainScreen].bounds) - 26;
        CGFloat countViewH = 25;
        CGFloat countViewX = CGRectGetMinX(self.TPCalculatorView.middleView.frame);
        CGFloat countViewY = CGRectGetMinY(self.TPCalculatorView.middleView.frame) + 10 + countViewH * i;
        //创建
        LSvTPCalculatorCountView *TPCalculatorCountView = [LSvTPCalculatorCountView TPCalculatorCountView];
        TPCalculatorCountView.frame = CGRectMake(countViewX, countViewY, countViewW, countViewH);
        //赋值
        TPCalculatorCountView.TPCalculatorCount = self.TPCalculatorCounts[i];
        TPCalculatorCountView.LSbCountChanged   = ^(NSString *count){
            //更新数据
            self.TPCalculatorCounts[i].count = count;
            //刷新显示
            [self reloadCalculatorResult];
            //保存数据
            [[LSmTPCalculatorCount toDicts:self.TPCalculatorCounts] writeToFile:LSPathUserTPCalculatorCountPlist atomically:YES];
        };
        //添加至父控件（并非加到中间的小View上
        [self.TPCalculatorView addSubview:TPCalculatorCountView];
    }

    /*** 底部label ***/
    
    //设置底部label代理
    self.TPCalculatorView.bottomLabel.delegate = self;
    //下划线
    self.TPCalculatorView.bottomLabel.linkAttributes = @{(NSString *)kCTUnderlineStyleAttributeName: @YES};
    //文本颜色
    self.TPCalculatorView.bottomLabel.textColor = self.controllerAttribute.color;
    //链接文字选中效果
    NSDictionary *activeLinkAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.TPCalculatorView.bottomLabel.activeLinkAttributes = activeLinkAttributes;
    //文本内容
    NSString *text = @"关于运输作战的游戏机制可访问此处查询\n感谢NGA论坛的欧米嘉·风焰提供的算法：\n   - TP算法讨论、验证、样本收集帖\n目前算法仍在验证阶段，如果你有计算不准确的案例，请访问上面提供的链接进行汇报";
    //设置绑定超链的范围
    NSRange linkRange1 = [text rangeOfString:@"可访问此处查询" options:NSCaseInsensitiveSearch];
    NSRange linkRange2 = [text rangeOfString:@"欧米嘉·风焰" options:NSCaseInsensitiveSearch];
    NSRange linkRange3 = [text rangeOfString:@"- TP算法讨论、验证、样本收集帖" options:NSCaseInsensitiveSearch];
    //设置文本及格式
    [self.TPCalculatorView.bottomLabel setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        //设置范围内文本的颜色
        [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[UIColor whiteColor].CGColor range:linkRange1];
        [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[UIColor whiteColor].CGColor range:linkRange2];
        [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[UIColor whiteColor].CGColor range:linkRange3];
        
        return mutableAttributedString;
    }];
    
    //设置链接
    NSURL *url1 = [NSURL URLWithString:@"http://kancolle.diablohu.com/guide/mechanism/transport/"];
    NSURL *url2 = [NSURL URLWithString:@"http://bbs.ngacn.cc/nuke.php?func=ucp&uid=13838394"];
    NSURL *url3 = [NSURL URLWithString:@"http://bbs.ngacn.cc/read.php?tid=8741165"];
    //将链接添加到label对应范围上
    [self.TPCalculatorView.bottomLabel addLinkToURL:url1 withRange:linkRange1];
    [self.TPCalculatorView.bottomLabel addLinkToURL:url2 withRange:linkRange2];
    [self.TPCalculatorView.bottomLabel addLinkToURL:url3 withRange:linkRange3];
}

#pragma mark - 重写布局

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat TPCalculatorViewX = 0;
    CGFloat TPCalculatorViewY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat TPCalculatorViewW = CGRectGetWidth(self.view.frame);
    CGFloat TPCalculatorViewH = CGRectGetHeight(self.view.frame) - TPCalculatorViewX;
    
    self.TPCalculatorView.frame = CGRectMake(TPCalculatorViewX, TPCalculatorViewY, TPCalculatorViewW, TPCalculatorViewH);
}

#pragma mark - TTT Attributed Label Delegate

- (void)attributedLabel:(__unused TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url
{
    //跳转至URL
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - 其他方法

- (void)reloadCalculatorResult
{
    NSInteger countDD  = self.TPCalculatorCounts[0].count.integerValue;
    NSInteger countCL  = self.TPCalculatorCounts[1].count.integerValue;
    NSInteger countCAV = self.TPCalculatorCounts[2].count.integerValue;
    NSInteger countBBV = self.TPCalculatorCounts[3].count.integerValue;
    NSInteger countAV  = self.TPCalculatorCounts[4].count.integerValue;
    NSInteger countLHA = self.TPCalculatorCounts[5].count.integerValue;
    NSInteger countAO  = self.TPCalculatorCounts[6].count.integerValue;
    NSInteger countSSV = self.TPCalculatorCounts[7].count.integerValue;
    NSInteger countCT  = self.TPCalculatorCounts[8].count.integerValue;
    NSInteger countE75 = self.TPCalculatorCounts[9].count.integerValue;
    NSInteger countE68 = self.TPCalculatorCounts[10].count.integerValue;
    
    NSInteger countS = 0, countA = 0;
    
    countS = countDD * 5 + countCL * 2 + countCAV * 4 + countAV * 9.5 + countLHA * 12.25 + countAO * 14.75 + countBBV * 7 + countSSV * 7 + countCT * 6 + countE75 * 5 + countE68 * 8;
    countA = countS * 0.7;
    
    self.TPCalculatorView.resultLabel.text = [NSString stringWithFormat:@"A胜：%ld | S胜：%ld",countA, countS];
}

#pragma mark - Lazy Load

- (NSMutableArray<LSmTPCalculatorCount *> *)TPCalculatorCounts
{
    if (!_TPCalculatorCounts) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:LSPathUserTPCalculatorCountPlist]) {
            _TPCalculatorCounts = [LSmTPCalculatorCount TPCalculatorCounts:LSPathUserTPCalculatorCountPlist];
        } else {
            _TPCalculatorCounts = [LSmTPCalculatorCount TPCalculatorCounts:[[NSBundle mainBundle] pathForResource:@"LSmTPCalculatorCount" ofType:@"plist"]];
        }
    }
    return _TPCalculatorCounts;
}

@end
