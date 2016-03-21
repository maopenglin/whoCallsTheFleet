//
//  LScBaseNavigationController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScBaseNavigationController.h"
#import "LScBaseViewController.h"

@interface LScBaseNavigationController ()

@end

@implementation LScBaseNavigationController

/**
 *  重写构造方法
 */
+ (void)initialize
{
    //获取全局navigationBar
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    //设置导航栏透明
    navigationBar.barStyle    = UIBarStyleBlack;
    navigationBar.translucent = YES;
}

/**
 *  自定义构造方法
 */
- (instancetype)initWithType:(LSkControllerType)controllerType
{
    //获取数据模型
    LSmControllerAttributes *controllerAttribute = LSSingletonControllerAttributes(controllerType);
    //创建子控制器
    LScBaseViewController *vc = [[controllerAttribute.controllerClass alloc] init];
    //包装于导航控制器内
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithRootViewController:vc];
    //为子控制器赋值
    vc.controllerAttribute = controllerAttribute;
    
    //添加背景图片
    UIImageView *backgroundImgView = [[UIImageView alloc] initWithFrame:vc.view.bounds];
    backgroundImgView.image = controllerAttribute.backgroundImage;
    vc.backgroundImgView = backgroundImgView;
    [vc.view addSubview:vc.backgroundImgView];
    
    //添加背景遮罩
    //暗色效果(待定)
//    UIView *maskView = [[UIView alloc] initWithFrame:vc.view.bounds];
//    maskView.backgroundColor = [UIColor blackColor];
//    maskView.backgroundColor = vc.controllerAttribute.color;
//    maskView.alpha = 0.1;
//    [vc.view addSubview:maskView];
    
//    if (controllerType == LSkControllerTypeAbout  ||
//        controllerType == LSkControllerTypeOption ||
//        controllerType == LSkControllerTypePatchNote ||
//        controllerType == LSkControllerTypeTPCalculator) {
    
    //毛玻璃效果
    UIBlurEffect *maskBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *maskBlurEffectView = [[UIVisualEffectView alloc] initWithFrame:vc.view.bounds];
    maskBlurEffectView.effect = maskBlurEffect;
//    maskBlurEffectView.alpha  = 0.99;
    [vc.view addSubview:maskBlurEffectView];
//    }

    return navVc;
}

//#pragma mark - Navigation Controller Delegate
//
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    static UIViewController *lastController = nil;
//    
//    //若上个view不为空
//    if (lastController != nil)
//    {
//        //若该实例实现了viewWillDisappear方法，则调用
//        if ([lastController respondsToSelector:@selector(viewWillDisappear:)])
//        {
//            [lastController viewWillDisappear:animated];
//        }
//    }
//    //将当前要显示的view设置为lastController，在下次view切换调用本方法时，会执行viewWillDisappear
//    lastController = viewController;
//    
//    [viewController viewWillAppear:animated];
//}
//
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    static UIViewController *lastController = nil;
//    
//    //若上个view不为空
//    if (lastController != nil)
//    {
//        //若该实例实现了viewWillDisappear方法，则调用
//        if ([lastController respondsToSelector:@selector(viewDidDisappear:)])
//        {
//            [lastController viewDidDisappear:animated];
//        }
//    }
//    //将当前要显示的view设置为lastController，在下次view切换调用本方法时，会执行viewWillDisappear
//    lastController = viewController;
//    
//    [viewController viewDidAppear:animated];
//}

@end
