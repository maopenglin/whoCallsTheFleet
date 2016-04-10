//
//  LScBaseTabBarController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScTabBarController.h"
#import "LScBaseNavigationController.h"

@interface LScTabBarController () <UITabBarControllerDelegate>

@end

@implementation LScTabBarController

#pragma mark - 类初始方法

+ (void)initialize
{
    //获取全局tabBar
    UITabBar *tabBar = [UITabBar appearance];
    
    //设置tabBar透明效果
    tabBar.barStyle = UIBarStyleBlack;
    [tabBar setTranslucent:YES];
}

#pragma mark - 工厂方法

- init
{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - 其他方法

- (void)addchildVCWithType:(LSkControllerType)controllerType
{
    
    //创建包装好的控制器
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithType:controllerType];
    
    //添加至tabBar控制器
    [self addChildViewController:navVc];
    
    //启动时显式调用代理方法 选中第一标签页
    if (controllerType == LSkControllerTypeFleet) {
        [self tabBarController:self didSelectViewController:navVc];
    }
}

#pragma mark - Tab Bar Controller Delegate

/**
 *  切换tabBar标签的代理方法
 */
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UITabBar *tabBar = tabBarController.tabBar;
    LSkControllerType controllerType = (LSkControllerType)[tabBar.items indexOfObject:tabBar.selectedItem];
    //切换标签时切换tabBarItem染色方案
    tabBar.tintColor = LSSingletonControllerAttributes(controllerType).color;
}

@end //LScTabBarController
