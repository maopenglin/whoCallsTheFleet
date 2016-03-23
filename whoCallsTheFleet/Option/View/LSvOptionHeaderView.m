//
//  LSvOptionHeaderView.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvOptionHeaderView.h"

#import "LSmControllerAttributes.h"

@interface LSvOptionHeaderView ()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIView *lineView;

@end //LSvOptionHeaderView

@implementation LSvOptionHeaderView

#pragma mark - 工厂方法

+ (instancetype)optionHeaderView
{
    return [[self alloc] init];
}
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
    
    //设置主题色
    self.titleLabel.textColor     = LSSingletonControllerAttributes(LSkControllerTypeOption).color;
    self.lineView.backgroundColor = LSSingletonControllerAttributes(LSkControllerTypeOption).color;
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

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLabel.text          = title;
    self.titleLabel.font          = LSFontWithSize(15);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
}

@end //LSvOptionHeaderView
