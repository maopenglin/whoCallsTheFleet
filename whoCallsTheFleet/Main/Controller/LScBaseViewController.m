//
//  LScBaseViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScBaseViewController.h"

#import "LSmControllerAttributes.h"

@interface LScBaseViewController ()

//背景图片
@property (nonatomic, weak) UIImageView *backgroundImgView;

@end //LScBaseViewController

@implementation LScBaseViewController

#pragma mark - 工厂方法

+ (instancetype)baseViewController
{
    return [[self alloc] init];
}
- (instancetype)init
{
    if (self = [super init]) {
        //添加背景图片
        UIImageView *backgroundImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        self.backgroundImgView = backgroundImgView;
        [self.view addSubview:self.backgroundImgView];
        //设置图片填充方式
        self.backgroundImgView.contentMode = UIViewContentModeScaleAspectFill;
        
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
        UIVisualEffectView *maskBlurEffectView = [[UIVisualEffectView alloc] initWithFrame:self.view.bounds];
        maskBlurEffectView.effect = maskBlurEffect;
        //    maskBlurEffectView.alpha  = 0.99;
        [self.view addSubview:maskBlurEffectView];
        //    }
    }
    return self;
}

#pragma mark - 重写set方法

- (void)setControllerAttribute:(LSmControllerAttributes *)controllerAttribute
{
    _controllerAttribute = controllerAttribute;
    
    //设置标题
    self.title = self.controllerAttribute.title;
    
    //设置导航栏文字格式
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: self.controllerAttribute.color, NSFontAttributeName:LSFontWithSize(20)};
    
    //设置导航栏内容颜色
    self.navigationController.navigationBar.tintColor = self.controllerAttribute.color;
    
    //背景图片
    self.backgroundImgView.image = controllerAttribute.backgroundImage;
}

@end //LScBaseViewController
