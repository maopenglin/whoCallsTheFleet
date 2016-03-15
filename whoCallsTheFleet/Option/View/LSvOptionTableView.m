//
//  LSvOptionTableView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/2.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvOptionTableView.h"

@interface LSvOptionTableView ()

@end

@implementation LSvOptionTableView

#pragma mark - 重写构造方法

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
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

+ (instancetype)optionTableView
{
    LSvOptionTableView *optionTableView = [[LSvOptionTableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    optionTableView.contentInset  = UIEdgeInsetsMake(44, 0, 0, 0);
    optionTableView.bounces = NO;
    
    return optionTableView;
}

- (void)setup
{
    //设置属性
    self.backgroundColor = [UIColor clearColor];
    self.allowsSelection = NO;
    self.separatorStyle  = UITableViewCellSeparatorStyleNone;
    
    //设置cell行高
    self.rowHeight = 55;
    
    //绑定单击操作
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark - 回调

- (void)keyboardHide
{
    [self endEditing:YES];
}
@end
