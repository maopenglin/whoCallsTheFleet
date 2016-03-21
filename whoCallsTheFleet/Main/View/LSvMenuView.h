//
//  LSvOtherMenuView.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSmControllerAttributes.h"

@protocol LSpMenuViewDelegate <NSObject>

/**
 *  点击了菜单栏某个选项的回调方法
 */
- (void)menuViewBtnDidClick:(UIButton *)button WithType:(LSkControllerType)controllerType;
/**
 *  在菜单栏上向左轻扫手势的代理方法
 */
- (void)menuViewLeftSwipe;

@end

@interface LSvMenuView : UIView

//设置开关标记
@property (assign, nonatomic, getter = isOpen) BOOL open;
//设置代理
@property (weak, nonatomic) id<LSpMenuViewDelegate> delegate;

//提供创建方法
+ (instancetype)menuView;

@end
