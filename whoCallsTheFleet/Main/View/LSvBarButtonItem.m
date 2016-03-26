//
//  LSvBarButtonItem.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/25.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvBarButtonItem.h"

@implementation LSvBarButtonItem

+ (instancetype)barButtonItemWithCustomView:(UIView *)customView
{
    return [[self alloc] initWithCustomView:customView];
}

- (instancetype)initWithCustomView:(UIView *)customView
{
    if (self = [super initWithCustomView:customView]) {
        ;
    }
    return self;
}

+ (instancetype)barButtonItemForMenu:(id)target action:(SEL)action
{
    //创建自定义Btn
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置fram
    itemBtn.frame = CGRectMake(0, 0, 20, 15);
    //拒绝不可用时的变暗效果
    itemBtn.adjustsImageWhenDisabled = NO;
    //设置背景图片及渲染方式
    [itemBtn setBackgroundImage:[[UIImage imageNamed:@"menuIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
//    NSDictionary *attDict = @{NSForegroundColorAttributeName: itemBtn.tintColor, NSFontAttributeName: LSFontIconSize(20)};
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:LSIconfontMenu attributes:attDict];
//    [itemBtn setAttributedTitle:attString forState:UIControlStateNormal];
    //绑定回调方法
    [itemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self barButtonItemWithCustomView:itemBtn];
}

+ (instancetype)barButtonItemForBack:(id)target action:(SEL)action
{
    //创建自定义Btn
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置fram
    itemBtn.frame = CGRectMake(0, 0, 10, 15);
    //设置旋转
    itemBtn.transform = CGAffineTransformMakeRotation(M_PI);
    //设置背景图片及渲染方式
    [itemBtn setBackgroundImage:[[UIImage imageNamed:@"arrowIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    //绑定回调方法
    [itemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self barButtonItemWithCustomView:itemBtn];
}

@end
