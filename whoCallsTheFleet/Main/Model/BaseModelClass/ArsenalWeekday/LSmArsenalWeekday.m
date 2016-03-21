//
//  LSmArsenalWeekday.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmArsenalWeekday.h"
#import "NSArray+LSJson.h"

@implementation LSmArsenalWeekday

+ (NSArray<LSmArsenalWeekday *> *)arsenalWeekday
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"arsenal_weekday"];
    NSMutableArray<LSmArsenalWeekday *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmArsenalWeekday *arsenalWeekday = [LSmArsenalWeekday arsenalWeekdayWithDict:dict];
        [descArr addObject:arsenalWeekday];
    }
    return descArr;
}

+ (instancetype)arsenalWeekdayWithDict:(NSDictionary *)dict
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
