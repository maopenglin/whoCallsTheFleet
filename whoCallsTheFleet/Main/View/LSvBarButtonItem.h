//
//  LSvBarButtonItem.h
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/3/25.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSvBarButtonItem : UIBarButtonItem

/**
 *  创建用于唤出菜单的左上角按钮
 */
+ (instancetype)barButtonItemForMenu:(nonnull id)target action:(nonnull SEL)action;
/**
 *  创建返回至上一页面按钮(pop或dismiss当前控制器
 */
+ (instancetype)barButtonItemForBack:(nonnull id)target action:(nonnull SEL)action;
/**
 *  创建返回至home按钮(pop至根控制器
 */
+ (instancetype)barButtonItemForHome:(nonnull id)target action:(nonnull SEL)action;

@end

NS_ASSUME_NONNULL_END