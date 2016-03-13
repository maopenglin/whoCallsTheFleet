//
//  LSmItemsImprovement.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmItemsImprovement.h"

@implementation LSmItemsImprovement

+ (NSArray<LSmItemsImprovement *> *)itemsImprovement:(NSArray<__kindof NSDictionary *> *)dictArr
{
    NSMutableArray<LSmItemsImprovement *> *descArr = [NSMutableArray array];
    dictArr = (NSArray *)dictArr;
    if (dictArr.class) {
        for (NSDictionary *dict in dictArr) {
            LSmItemsImprovement *itemsImprovment = [LSmItemsImprovement itemsImprovementWithDict:dict];
            [descArr addObject:itemsImprovment];
        }
    }
    
    return descArr;
}

+ (instancetype)itemsImprovementWithDict:(NSDictionary *)dict
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
