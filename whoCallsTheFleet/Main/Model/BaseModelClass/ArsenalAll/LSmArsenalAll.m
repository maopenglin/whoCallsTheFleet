//
//  LSmArsenalAll.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/15.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmArsenalAll.h"
#import "NSArray+LSJson.h"

@implementation LSmArsenalAll

+ (NSArray<LSmArsenalAll *> *)arsenalAll
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"arsenal_all"];
    NSMutableArray<LSmArsenalAll *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmArsenalAll *arsenalAll = [LSmArsenalAll arsenalAllWithDict:dict];
        [descArr addObject:arsenalAll];
    }
    return descArr;
}

+ (instancetype)arsenalAllWithDict:(NSDictionary *)dict
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