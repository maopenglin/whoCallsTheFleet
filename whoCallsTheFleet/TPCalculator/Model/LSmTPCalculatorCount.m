//
//  LSmTPCalculatorCount.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/11.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmTPCalculatorCount.h"

@implementation LSmTPCalculatorCount

+ (NSMutableArray<LSmTPCalculatorCount *> *)TPCalculatorCounts:(NSString *)plistPath
{
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray<LSmTPCalculatorCount *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmTPCalculatorCount *TPCalculatorCount = [LSmTPCalculatorCount TPCalculatorCountWithDict:dict];
        [descArr addObject:TPCalculatorCount];
    }
    return descArr;
}
+ (NSArray<NSDictionary *> *)toDicts:(NSMutableArray<LSmTPCalculatorCount *> *)TPCalculatorCounts
{
    NSMutableArray<NSDictionary *> *dictArr = [NSMutableArray array];
    
    for (LSmTPCalculatorCount *TPCalculatorCount in TPCalculatorCounts) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"title"] = TPCalculatorCount.title;
        dict[@"count"] = TPCalculatorCount.count;
        
        [dictArr addObject:dict];
    }
    return dictArr;
}

+ (instancetype)TPCalculatorCountWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
