//
//  LSmOption.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/4.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmOptionItem;

@interface LSmOption : NSObject

@property (nonatomic, strong) NSMutableArray<LSmOptionItem *> *items;
@property (nonatomic, copy) NSString *title;

//工厂方法
+ (instancetype)optionWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 *  提供option模型数组
 */
+ (NSMutableArray<LSmOption *> *)options:(NSString *)plistPath;
/**
 *  提供option字典数组
 */
+ (NSArray<NSDictionary *> *)toDicts:(NSMutableArray<LSmOption *> *)options;

@end
