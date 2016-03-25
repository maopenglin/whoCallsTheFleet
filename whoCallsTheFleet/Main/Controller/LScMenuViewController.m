//
//  LScMenuViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScMenuViewController.h"

#import "LSvBarButtonItem.h"

@implementation LScMenuViewController

#pragma mark - 工厂方法

+ (instancetype)menuViewController
{
    return [[self alloc] init];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}
- (void)setupController
{
    [super setupController];
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏tabBar
    self.hidesBottomBarWhenPushed = YES;
    
    //创建返回按钮并绑定回调方法
    LSvBarButtonItem *dismissItem = [LSvBarButtonItem barButtonItemForBack:self action:@selector(dismissItemDidClick)];
    //添加至导航栏
    self.navigationItem.leftBarButtonItem = dismissItem;
}

#pragma mark - 回调方法

- (void)dismissItemDidClick
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end //LScMenuViewController
