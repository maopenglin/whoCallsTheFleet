//
//  AppDelegate.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/8.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "AppDelegate.h"

#import "LScTabBarController.h"
#import "LScBaseViewController.h"
#import "LScBaseNavigationController.h"

#import "LSmControllerAttributes.h"

@interface AppDelegate ()

@property (nonatomic, strong) LScTabBarController *tabBarVc;

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
    
    //创建TabBarViewController子控制器
    //舰队
    [self.tabBarVc addchildVCWithType:LSkControllerTypeFleet];
    //舰娘
    [self.tabBarVc addchildVCWithType:LSkControllerTypeShips];
    //物品
    [self.tabBarVc addchildVCWithType:LSkControllerTypeItems];
    //改修工厂
    [self.tabBarVc addchildVCWithType:LSkControllerTypeArsenal];
    //声优&画师
    [self.tabBarVc addchildVCWithType:LSkControllerTypeEntities];
    
    //设置tabBarVc为window的根控制器
    self.window.rootViewController = self.tabBarVc;
    
    //设置window为主窗口
    [self.window makeKeyAndVisible];
    
    
    //设置前景图片
    //设置前景变暗淡出效果
    __block UIImageView *backgroundImgView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    backgroundImgView.image = LSSingletonControllerAttributes(kNilOptions).backgroundImage;
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

@end