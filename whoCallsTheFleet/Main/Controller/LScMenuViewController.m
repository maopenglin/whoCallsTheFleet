//
//  LScMenuViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScMenuViewController.h"

@implementation LScMenuViewController

#pragma mark - 工厂方法

+ (instancetype)menuViewController
{
    return [[self alloc] init];
}
- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏tabBar
    self.hidesBottomBarWhenPushed = YES;
    
    //添加返回按钮
    UIBarButtonItem * dismissItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(dismissItemDidClick)];
    self.navigationItem.leftBarButtonItem = dismissItem;
}

#pragma mark - 回调方法

- (void)dismissItemDidClick
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end //LScMenuViewController
