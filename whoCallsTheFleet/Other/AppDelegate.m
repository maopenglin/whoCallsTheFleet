//
//  AppDelegate.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/8.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "AppDelegate.h"

#import "LScTabBarController.h"

#import "LScBaseNavigationController.h"
#import "LScTabChildViewController.h"

#import "LScBaseViewController.h"

#import "LScFleetViewController.h"
#import "LScShipsViewController.h"
#import "LScItemsViewController.h"
#import "LScArsenalViewController.h"
#import "LScEntitiesViewController.h"

#import "LSmControllerAttributes.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

//
@property (nonatomic, strong) LScTabBarController *tabBarVc;
@property (nonatomic, strong) UIImage *backgroundImage;

@end

@implementation AppDelegate

#pragma mark - app生命周期方法

/**
 *  重写application启动方法
 */
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    //设置状态栏为隐藏
    application.statusBarHidden = YES;
    
    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //创建tableBarViewController
    self.tabBarVc = [[LScTabBarController alloc] init];
    //设置代理
    self.tabBarVc.delegate = self;
    
    //创建TabBarViewController子控制器
    //舰队
    [self addchildVCWithType:LSkControllerTypeFleet];
    //舰娘
    [self addchildVCWithType:LSkControllerTypeShips];
    //物品
    [self addchildVCWithType:LSkControllerTypeItems];
    //改修工厂
    [self addchildVCWithType:LSkControllerTypeArsenal];
    //声优&画师
    [self addchildVCWithType:LSkControllerTypeEntities];
    
    //设置tabBarVc为window的根控制器
    self.window.rootViewController = self.tabBarVc;
    
    //设置window为主窗口
    [self.window makeKeyAndVisible];
    
    
    //设置前景图片
    //设置前景变暗淡出效果
    __block UIImageView *backgroundImgView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    backgroundImgView.image = self.backgroundImage;
    backgroundImgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.window addSubview:backgroundImgView];
    //暗色效果
    __block UIView *maskView = [[UIView alloc] initWithFrame:backgroundImgView.bounds];
    maskView.backgroundColor = LSColorWithRGBA(150, 150, 150, 0);
    [self.window addSubview:maskView];
    
    //2秒内淡出变暗并释放相关资源
    [UIView animateWithDuration:2.0 animations:^{
        //淡出效果
        backgroundImgView.alpha = 0.0;
        //变暗效果
        maskView.alpha = 1.0;
    } completion:^(BOOL finished) {
        //释放变暗效果
        [maskView removeFromSuperview];
        maskView = nil;
        //释放前景View
        [backgroundImgView removeFromSuperview];
        backgroundImgView = nil;
    }];
    
    return YES;
}

/**
 *  创建用NavVc包装的子控制器并添加至TabBarVc中
 *
 *  @param vc             子控制器
 *  @param controllerType 子控制器类型
 */
- (void)addchildVCWithType:(LSkControllerType)controllerType{
    
    //创建包装好的控制器
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithType:controllerType AndBackgroundImage:self.backgroundImage];
    
    //添加至tabBar控制器
    [self.tabBarVc addChildViewController:navVc];
    
    //选中第一标签页
    if (controllerType == LSkControllerTypeFleet) {
        [self tabBarController:self.tabBarVc didSelectViewController:navVc];
    }
}

#pragma mark - Tab Bar Controller Delegate

/**
 *  切换tabBar标签的代理方法
 */
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //对参数做两次类型转换获取属性值并做设置
    viewController.tabBarController.tabBar.tintColor = ((LScBaseViewController *)((LScBaseNavigationController *)viewController).viewControllers.lastObject).controllerAttribute.color;
}

#pragma mark - Lazy Load

- (UIImage *)backgroundImage
{
    if (!_backgroundImage) {
        //随机选取背景图片
        int rndNum = arc4random()%15;
        NSString *imageName = [NSString stringWithFormat:@"tbg%d",rndNum];
        _backgroundImage = [UIImage imageNamed:imageName];
    }
    return _backgroundImage;
}

@end
