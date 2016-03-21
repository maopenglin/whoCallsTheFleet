//
//  LScBaseTabBarController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScTabBarController.h"

@interface LScTabBarController ()

@end

@implementation LScTabBarController

/**
 *  重写构造方法
 */
+ (void)initialize
{
    //获取全局tabBar
    UITabBar *tabBar = [UITabBar appearance];
    
    //设置tabBar透明效果
    tabBar.barStyle = UIBarStyleBlack;
    [tabBar setTranslucent:YES];
}

@end
