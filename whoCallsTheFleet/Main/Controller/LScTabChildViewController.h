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

@end
