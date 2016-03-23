//
//  LSvOptionTableView.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/2.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvOptionTableView.h"

@implementation LSvOptionTableView

#pragma mark - 工厂方法

+ (instancetype)optionTableView
{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
}

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

- (void)setup
{
    //设置属性
    self.backgroundColor = [UIColor clearColor];
    self.allowsSelection = NO;
    self.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.bounces         = NO;
    
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

@end //LSvOptionTableView
