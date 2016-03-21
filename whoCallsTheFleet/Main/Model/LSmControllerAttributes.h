//
//  LSmControllerAttributes.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/29.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  控制器枚举
 *
 *  用于表示控制器的类型
 */
typedef NS_ENUM (NSUInteger, LSkControllerType){
    //tableViewConroller的子控制器
    LSkControllerTypeFleet    = 0,//舰队配置
    LSkControllerTypeShips    = 1,//舰娘
    LSkControllerTypeItems    = 2,//装备
    LSkControllerTypeArsenal  = 3,//改修工厂
    LSkControllerTypeEntities = 4,//声优&画师
    
    //其他子控制器
    LSkControllerTypeTPCalculator = 5,//TP计算器
    LSkControllerTypeOption       = 6,//设置
    LSkControllerTypePatchNote    = 7,//更新记录
    LSkControllerTypeAbout        = 8,//关于
};

@interface LSmControllerAttributes : NSObject

//控制器类型
@property (nonatomic, assign, readonly) LSkControllerType controllerType;
//控制器的类
@property (nonatomic, assign, readonly) Class controllerClass;
//控制器的标题
@property (nonatomic, copy, readonly) NSString *title;
//控制器的主题色
@property (nonatomic, strong, readonly) UIColor *color;
//控制器的图标
@property (nonatomic, copy, readonly) NSString *itemIconName;
//控制器背景图片
@property (nonatomic, strong, readonly) UIImage *backgroundImage;

/**
 *  返回一个控制器属性组成的数组（单例
 */
+ (NSArray<LSmControllerAttributes *> *)sharedControllerAttributes;

@end
