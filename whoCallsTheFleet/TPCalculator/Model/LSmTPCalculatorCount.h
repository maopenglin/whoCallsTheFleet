//
//  LSmTPCalculatorCount.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/11.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmTPCalculatorCount : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *count;

//工厂方法
+ (instancetype)TPCalculatorCountWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 *  提供模型数组
 */
+ (NSMutableArray<LSmTPCalculatorCount *> *)TPCalculatorCounts:(NSString *)plistPath;
/**
 *  提供字典数组
 */
+ (NSArray<NSDictionary *> *)toDicts:(NSMutableArray<LSmTPCalculatorCount *> *)TPCalculatorCounts;

@end
