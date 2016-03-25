//
//  LSvBarButtonItem.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/25.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSvBarButtonItem : UIBarButtonItem

+ (instancetype)barButtonItemWithCustomView:(nonnull UIView *)customView;
/**
 *  创建用于唤出菜单的左上角按钮
 */
+ (instancetype)barButtonItemForMenu:(nonnull id)target action:(nonnull SEL)action;
/**
 *  创建返回按钮(pop或dismiss当前控制器
 */
+ (instancetype)barButtonItemForBack:(nonnull id)target action:(nonnull SEL)action;

@end

NS_ASSUME_NONNULL_END