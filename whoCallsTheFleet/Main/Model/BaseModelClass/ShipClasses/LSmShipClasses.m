//
//  LSmShipClasses.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmShipClasses.h"
#import "NSArray+LSJson.h"
#import "LSmName.h"

@implementation LSmShipClasses

+ (NSArray<LSmShipClasses *> *)shipClasses
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"ship_classes"];
    NSMutableArray<LSmShipClasses *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmShipClasses *shipClasses = [LSmShipClasses shipClassesWithDict:dict];
        [descArr addObject:shipClasses];
    }
    return descArr;
}

+ (instancetype)shipClassesWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name       = [[LSmName alloc] init];
        self.name.game  = dict[@"name_game"];
        self.name.zhCn  = dict[@"name_zh"];
        self.shipTypeId = dict[@"ship_type_id"];
        self.idLS2016   = dict[@"idLS2016"];
        self._id        = dict[@"_id"];
    }
    return self;
}

@end
