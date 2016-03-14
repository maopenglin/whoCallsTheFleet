//
//  LScTabChildViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScTabChildViewController.h"
#import "LScBaseNavigationController.h"
#import "LScMenuViewController.h"

@interface LScTabChildViewController ()<LSpOtherMenuViewDelegate>

//侧边栏菜单按钮
@property (nonatomic, weak) UIBarButtonItem *otherBtnItem;
//遮罩按钮 用于接收单击事件收回侧边栏菜单
@property (nonatomic, weak) UIButton *maskBtn;

//控制器数据模型
@property (nonatomic, strong) NSArray<LSmControllerAttributes *> *controllerAttributes;

@end

@implementation LScTabChildViewController

#pragma mark - 重写view生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置item图标
    self.tabBarItem.image = [[UIImage imageNamed:self.controllerAttribute.itemIconName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    //左上角添加按钮
    UIBarButtonItem *otherBtnItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"otherItem"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(otherMenuBtnItemDidClick)];
    self.otherBtnItem = otherBtnItem;
    
    //设置该按钮属性
    self.navigationItem.leftBarButtonItem = self.otherBtnItem;
    
    //创建侧边菜单栏
    LSvOtherMenuView *otherMenuView = [LSvOtherMenuView otherMenuView];
    self.otherMenuView = otherMenuView;
    //设置代理
    self.otherMenuView.delegate = self;
    //添加至View
    [self.view addSubview:self.otherMenuView];
    
    //添加屏幕边缘右滑响应
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(otherMenuViewRightSwipe)];
    screenEdgePanGestureRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:screenEdgePanGestureRecognizer];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.view bringSubviewToFront:self.otherMenuView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //切换页面时收回侧边栏
    self.otherMenuView.transform = CGAffineTransformMakeTranslation(0, 0);
    self.otherMenuView.open = NO;
    //释放遮罩按钮
    [self freeMaskBtn];
}

#pragma mark - 回调方法

/**
 *  导航栏左上角按钮绑定回调方法
 *  判断侧边菜单栏状态并执行动画（左滑右滑）动画过程中屏蔽呼出菜单按钮
 */
- (void)otherMenuBtnItemDidClick
{
    [self.view bringSubviewToFront:self.otherMenuView];
    //若菜单栏开启
    if (self.otherMenuView.isOpen) {
        //菜单按钮不可用
        self.otherBtnItem.enabled = NO;
        //释放遮罩按钮
        [self freeMaskBtn];
        //动画
        [UIView animateWithDuration:0.5 animations:^{
            //菜单平移收回
            self.otherMenuView.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            self.otherMenuView.open = NO;
            //菜单按钮可用
            self.otherBtnItem.enabled = YES;
        }];
    }
    //若菜单栏关闭
    else{
        //菜单按钮不可用
        self.otherBtnItem.enabled = NO;
        //动画
        [UIView animateWithDuration:0.5 animations:^{
            //菜单平移展开
            self.otherMenuView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width * 0.3, 0);
        } completion:^(BOOL finished) {
            self.otherMenuView.open = YES;
            //菜单按钮可用
            self.otherBtnItem.enabled = YES;
            
            //创建遮罩按钮
            UIButton *maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.maskBtn = maskButton;
            [self.navigationController.view addSubview:self.maskBtn];
            [self.navigationController.view bringSubviewToFront:self.maskBtn];
            
            //设置遮罩按钮frame
            CGFloat maskBtnX = self.otherMenuView.frame.size.width;
            CGFloat maskBtnY = self.otherMenuView.frame.origin.y;
            CGFloat maskBtnW = [UIScreen mainScreen].bounds.size.width - maskBtnX;
            CGFloat maskBtnH = self.otherMenuView.frame.size.height;
            self.maskBtn.frame = CGRectMake(maskBtnX, maskBtnY, maskBtnW, maskBtnH);
            //为遮罩按钮绑定回调
            [self.maskBtn addTarget:self action:@selector(maskBtnDidClick) forControlEvents:UIControlEventTouchDown];
        }];
    }
}
/**
  *  点击遮罩按钮的回调方法
  */
- (void)maskBtnDidClick
{
    [self otherMenuBtnItemDidClick];
}
/**
 *  释放遮罩按钮的回调方法
 */
- (void)freeMaskBtn
{
    if (self.maskBtn) {
        [self.maskBtn removeFromSuperview];
    self.maskBtn = nil;
    }
}
/**
 *  在屏幕左边缘向右滑动的回调方法
 */
- (void)otherMenuViewRightSwipe
{
    if (!self.otherMenuView.isOpen) {
        [self otherMenuBtnItemDidClick];
    }
}
/**
 *  重置侧边栏布局的回调方法
 */
- (void)layoutOtherMenuView
{
    //计算侧边菜单栏frame
    CGFloat otherMenuViewX = -[UIScreen mainScreen].bounds.size.width * 0.3;
    CGFloat otherMenuViewY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat otherMenuViewW = -otherMenuViewX;
    CGFloat otherMenuViewH = CGRectGetMinY(self.tabBarController.tabBar.frame) - otherMenuViewY;
    //重置侧边菜单栏frame
    self.otherMenuView.frame = CGRectMake(otherMenuViewX, otherMenuViewY, otherMenuViewW, otherMenuViewH);
}
/**
  *  创建子控制器并用NavVc包装
  */
- (LScBaseNavigationController *)navVCWithType:(LSkControllerType)controllerType{
    //创建控制器
    LScMenuViewController *vc = [[self.controllerAttributes[controllerType].controllerClass alloc] init];
    //包装于导航控制器内
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithRootViewController:vc];
    //赋值
    vc.controllerAttribute = self.controllerAttributes[controllerType];

    return navVc;
}


#pragma mark - Other Menu View Delegate

- (void)otherMenuViewBtnDidClick:(UIButton *)button WithType:(LSkControllerType)controllerType
{
    //新建控制器
    LScBaseNavigationController *navVc = [[LScBaseNavigationController alloc] initWithType:controllerType AndBackgroundImage:self.backgroundImgView.image];

    //模态控制器
    [self presentViewController:navVc animated:YES completion:^{
        [self otherMenuBtnItemDidClick];
    }];
}
- (void)otherMenuViewLeftSwipe
{
    [self otherMenuBtnItemDidClick];
}

#pragma mark - 重写set方法

- (void)setMaskBtn:(UIButton *)maskBtn
{
    if (!_maskBtn) {
        _maskBtn = maskBtn;
    }
}
#pragma mark - Lazy Load

- (NSArray<LSmControllerAttributes *> *)controllerAttributes
{
    if (!_controllerAttributes) {
        _controllerAttributes = [LSmControllerAttributes sharedControllerAttributes];
    }
    
    return _controllerAttributes;
}
@end
