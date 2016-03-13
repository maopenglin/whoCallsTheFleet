//
//  LSvOtherMenuView.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSmControllerAttributes.h"

@protocol LSpOtherMenuViewDelegate <NSObject>

//点击菜单内按钮的代理方法
- (void)otherMenuViewBtnDidClick:(UIButton *)button WithType:(LSkControllerType)controllerType;
//向左轻扫菜单的代理方法
- (void)otherMenuViewLeftSwipe;

@end

@interface LSvOtherMenuView : UIView

//设置开关标记
@property (assign, nonatomic, getter=isOpen) BOOL open;
//设置代理
@property (weak, nonatomic) id<LSpOtherMenuViewDelegate> delegate;

//控制器数据模型
@property (nonatomic, strong) NSArray<LSmControllerAttributes *> *controllerAttributes;

//提供创建方法
+ (instancetype)otherMenuView;

@end
