//
//  LScBaseTabBarController.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSmControllerAttributes.h"

@interface LScTabBarController : UITabBarController

/*!
 *  @brief 创建用NavVc包装的子控制器并添加至TabBarVc中
 *  @param controllerType 子控制器类型
 */
- (void)addchildVCWithType:(LSkControllerType)controllerType;

@end //LScTabBarController
