//
//  LScTabChildViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScTabChildViewController.h"
#import "LScMenuViewController.h"
#import "LScBaseNavigationController.h"

#import "LSvBarButtonItem.h"

@interface LScTabChildViewController ()<LSpMenuViewDelegate>

/**
 *  侧边栏菜单按钮
 */
@property (nonatomic, weak) UIBarButtonItem *menuBtnItem;
/**
 *  遮罩按钮 用于接收单击事件收回侧边栏菜单
 */
@property (nonatomic, weak) UIButton *menuMaskBtn;

@end //LScTabChildViewController

@implementation LScTabChildViewController

#pragma mark - 工厂方法

+ (instancetype)tabChildViewController
{
    return [[self alloc] init];
}

- (void)setupController
{
    [super setupController];
    //创建侧边菜单栏
    LSvMenuView *menuView = [LSvMenuView menuView];
    self.menuView = menuView;
    self.menuView.open = NO;
    //设置代理
    self.menuView.delegate = self;
    //添加至View
    [self.view addSubview:self.menuView];
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad
{
    [super viewDidLoad];
    //添加屏幕边缘右滑响应
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(menuViewRightSwipe)];
    screenEdgePanGestureRecognizer.edges = UIRectEdgeLeft;
    self.screenEdgePanGestureRecognizer = screenEdgePanGestureRecognizer;
    
    //创建左上角菜单按钮并绑定回调方法
    LSvBarButtonItem *menuBtnItem = [LSvBarButtonItem barButtonItemForMenu:self action:@selector(menuBtnItemDidClick)];
    self.menuBtnItem = menuBtnItem;
    //关联该按钮至导航栏
    self.navigationItem.leftBarButtonItem = self.menuBtnItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //切换页面时收回侧边栏
    self.menuView.transform = CGAffineTransformMakeTranslation(0, 0);
    self.menuView.open = NO;
    //释放遮罩按钮
    [self freeMaskBtn];
}
#pragma mark - 重写布局方法

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //若菜单栏关闭状态则进行布局充值
    if (!self.menuView.isOpen) {
        [self layoutMenuView];
    }
}

#pragma mark - 回调方法

/**
 *  导航栏左上角按钮绑定回调方法
 *  判断侧边菜单栏状态并执行动画（左滑右滑）动画过程中屏蔽呼出菜单按钮
 */
- (void)menuBtnItemDidClick
{
    //若菜单栏开启
    if (self.menuView.isOpen) {
        //菜单按钮不可用
        self.menuBtnItem.enabled = NO;
        //释放遮罩按钮
        [self freeMaskBtn];
        //动画
        [UIView animateWithDuration:0.5 animations:^{
            //菜单平移收回
            self.menuView.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            //标记为关
            self.menuView.open = NO;
            //菜单按钮可用
            self.menuBtnItem.enabled = YES;
        }];
    }
    //若菜单栏关闭
    else {
        //菜单按钮不可用
        self.menuBtnItem.enabled = NO;
        //动画
        [UIView animateWithDuration:0.5 animations:^{
            //菜单平移展开
            self.menuView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width * 0.3, 0);
        } completion:^(BOOL finished) {
            //创建遮罩按钮
            UIButton *menuMaskBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.menuMaskBtn = menuMaskBtn;
            self.menuMaskBtn.backgroundColor = [UIColor redColor];
            [self.view addSubview:self.menuMaskBtn];

            //设置遮罩按钮frame
            CGFloat menuMaskBtnX = self.menuView.frame.size.width;
            CGFloat menuMaskBtnY = self.menuView.frame.origin.y;
            CGFloat menuMaskBtnW = [UIScreen mainScreen].bounds.size.width - menuMaskBtnX;
            CGFloat menuMaskBtnH = self.menuView.frame.size.height;
            self.menuMaskBtn.frame = CGRectMake(menuMaskBtnX, menuMaskBtnY, menuMaskBtnW, menuMaskBtnH);
            //为遮罩按钮绑定回调
            [self.menuMaskBtn addTarget:self action:@selector(maskBtnDidClick) forControlEvents:UIControlEventTouchDown];
            //标记为开
            self.menuView.open = YES;
            //菜单按钮可用
            self.menuBtnItem.enabled = YES;
        }];
    }
}
/**
  *  点击遮罩按钮的回调方法
  */
- (void)maskBtnDidClick
{
    if (self.menuView.isOpen) {
        [self menuBtnItemDidClick];
    } else {
        [self freeMaskBtn];
    }
}
/**
 *  释放遮罩按钮的回调方法
 */
- (void)freeMaskBtn
{
    if (self.menuMaskBtn) {
        [self.menuMaskBtn removeFromSuperview];
        self.menuMaskBtn = nil;
    }
}

/**
 *  在屏幕左边缘向右滑动的回调方法
 */
- (void)menuViewRightSwipe
{
    if (!self.menuView.isOpen) {
        [self menuBtnItemDidClick];
    }
}

/**
 *  重置侧边栏布局的回调方法
 */
- (void)layoutMenuView
{
    //计算侧边菜单栏frame
    CGFloat menuViewX = -[UIScreen mainScreen].bounds.size.width * 0.3;
    CGFloat menuViewY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat menuViewW = -menuViewX;
    CGFloat menuViewH = CGRectGetMinY(self.tabBarController.tabBar.frame) - menuViewY;
    //重置侧边菜单栏frame
    self.menuView.frame = CGRectMake(menuViewX, menuViewY, menuViewW, menuViewH);
}
/**
  *  创建子控制器并用NavVc包装
  */
- (LScBaseNavigationController *)navVCWithType:(LSkControllerType)controllerType{
    //创建控制器
    LScMenuViewController *vc = [[LSSingletonControllerAttributes(controllerType).class alloc] init];
    //包装于导航控制器内
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithRootViewController:vc];
    //赋值
    vc.controllerAttribute = LSSingletonControllerAttributes(controllerType);

    return navVc;
}


#pragma mark - Other Menu View Delegate

/**
 *  点击了菜单栏某个选项的代理方法
 */
- (void)menuViewBtnDidClick:(UIButton *)button WithType:(LSkControllerType)controllerType
{
    //新建控制器
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithType:controllerType];

    //模态控制器
    [self presentViewController:navVc animated:YES completion:^{
        [self menuBtnItemDidClick];
    }];
}
/**
 *  在菜单栏上向左轻扫手势的代理方法
 */
- (void)menuViewLeftSwipe
{
    [self menuBtnItemDidClick];
}

#pragma mark - 重写set方法

- (void)setMenuMaskBtn:(UIButton *)menuMaskBtn
{
    if (!_menuMaskBtn) {
        _menuMaskBtn = menuMaskBtn;
    }
}

- (void)setControllerAttribute:(LSmControllerAttributes *)controllerAttribute
{
    [super setControllerAttribute:controllerAttribute];
    
    //设置item图标
    self.tabBarItem.image = [[UIImage imageNamed:self.controllerAttribute.itemIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end //LScTabChildViewController
