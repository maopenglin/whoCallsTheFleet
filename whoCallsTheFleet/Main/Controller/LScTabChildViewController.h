//
//  LScTabChildViewController.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScBaseViewController.h"
#import "LSvOtherMenuView.h"

@interface LScTabChildViewController : LScBaseViewController

//侧边栏菜单
@property (nonatomic, weak) LSvOtherMenuView *otherMenuView;

/**
 *  侧边栏布局重置回调
 */
- (void) layoutOtherMenuView;
/**
 *  导航栏左上角按钮绑定回调方法
 *  判断侧边菜单栏状态并执行动画（左滑右滑）动画过程中屏蔽呼出菜单按钮
 */
- (void)otherMenuBtnItemDidClick;

@end
