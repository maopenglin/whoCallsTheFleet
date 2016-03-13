//
//  LSvOptionHeaderView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvOptionHeaderView.h"

@interface LSvOptionHeaderView ()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIView *lineView;

@end
@implementation LSvOptionHeaderView

#pragma mark - 重写构造方法

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

#pragma mark - 快速创建

+ (instancetype)optionHeaderView
{
    LSvOptionHeaderView *optionHeaderView = [[LSvOptionHeaderView alloc] init];
    
    return optionHeaderView;
}
- (void)setup
{
    //标题栏
    CGFloat titleLabelX = 20;
    CGFloat titleLabelY = 0;
    CGFloat titleLabelW = 100;
    CGFloat titleLabelH = 30;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH)];
    self.titleLabel = titleLabel;
    [self addSubview:self.titleLabel];
    self.backgroundColor = [UIColor darkGrayColor];
    
    //分割线
    UIView *lineView = [[UIView alloc] init];
    self.lineView = lineView;
    [self addSubview:self.lineView];
}

#pragma mark - 重写布局方法

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //重设分割线Frame
    CGFloat lineViewX   = 0;
    CGFloat lineViewY   = CGRectGetMaxY(self.bounds) - 2;
    CGFloat lineViewW   = CGRectGetWidth(self.bounds);
    CGFloat lineViewH   = 2;

    self.lineView.frame = CGRectMake(lineViewX, lineViewY, lineViewW, lineViewH);
}

#pragma mark - 重写Set方法

-(void)setColor:(UIColor *)color
{
    _color = color;
    
    self.titleLabel.textColor     = color;
    self.lineView.backgroundColor = color;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLabel.text          = title;
    self.titleLabel.font          = LSFontWithSize(15);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
}

@end
