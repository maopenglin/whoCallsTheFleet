//
//  LScBaseNavigationController.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSmControllerAttributes.h"

@interface LScBaseNavigationController : UINavigationController

/**
 *  创建子控制器并用NavVc包装
 *
 *  @param controllerType  子控制器类型
 *  @param backgroundImage 背景图片
 *
 *  @return 包装后的导航控制器
 */
- (instancetype)initWithType:(LSkControllerType)controllerType AndBackgroundImage:(UIImage *)backgroundImage;

@end
