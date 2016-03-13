//
//  LScMenuViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScMenuViewController.h"

@interface LScMenuViewController ()

@end

@implementation LScMenuViewController

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

@end
