//
//  LScFleetViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScFleetViewController.h"
#import "TTTAttributedLabel.h"

@interface LScFleetViewController ()<TTTAttributedLabelDelegate>

@end

@implementation LScFleetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *  重写子控件布局方法
 */
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //单次执行以下代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self layoutOtherMenuView];
    });
}

@end
