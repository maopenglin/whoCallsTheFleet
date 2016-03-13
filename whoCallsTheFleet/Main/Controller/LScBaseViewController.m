//
//  LScBaseViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScBaseViewController.h"

@interface LScBaseViewController ()

@end

@implementation LScBaseViewController

#pragma mark - 重写布局方法

-(void)viewDidLayoutSubviews
{
    self.mainView.frame           = self.view.frame;
    self.mainTableView.frame      = self.view.frame;
    self.mainCollectionView.frame = self.view.frame;
    
    [self.view bringSubviewToFront:self.mainView];
    [self.view bringSubviewToFront:self.mainTableView];
    [self.view bringSubviewToFront:self.mainCollectionView];
}

#pragma mark - 重写set方法

-(void)setBackgroundImgView:(UIImageView *)backgroundImgView
{
    _backgroundImgView = backgroundImgView;
    
    //设置图片填充方式
    self.backgroundImgView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)setControllerAttribute:(LSmControllerAttributes *)controllerAttribute
{
    _controllerAttribute = controllerAttribute;
    
    //设置标题
    self.title = self.controllerAttribute.title;
    
    //设置导航栏文字格式
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: self.controllerAttribute.color, NSFontAttributeName:LSFontWithSize(20)};
    
    //设置导航栏内容颜色
    self.navigationController.navigationBar.tintColor = self.controllerAttribute.color;
}

@end
