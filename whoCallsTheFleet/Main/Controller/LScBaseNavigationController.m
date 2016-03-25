//
//  LScBaseNavigationController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScBaseNavigationController.h"
#import "LScBaseViewController.h"

@implementation LScBaseNavigationController

#pragma mark - 构造方法

+ (void)initialize
{
    //获取全局navigationBar
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    //设置导航栏透明
    navigationBar.barStyle    = UIBarStyleBlack;
    navigationBar.translucent = YES;
}

#pragma mark - 工厂方法

- (instancetype)initWithType:(LSkControllerType)controllerType
{
    //获取数据模型
    LSmControllerAttributes *controllerAttribute = LSSingletonControllerAttributes(controllerType);
    //创建子控制器
    LScBaseViewController *vc = [[controllerAttribute.class alloc] init];
    //包装于导航控制器内
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithRootViewController:vc];
    //为子控制器赋值
    vc.controllerAttribute = controllerAttribute;

    return navVc;
}

@end //LScBaseNavigationController