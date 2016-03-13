//
//  LSmShipTypeOrder.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmShipTypeOrder.h"
#import "LSmName.h"
#import "NSArray+LSJson.h"

@implementation LSmShipTypeOrder

+ (NSArray<LSmShipTypeOrder *> *)shipTypeOrder
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"ship_type_order"];
    NSMutableArray<LSmShipTypeOrder *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmShipTypeOrder *shipTypeOrder = [LSmShipTypeOrder shipTypeOrderWithDict:dict];
        [descArr addObject:shipTypeOrder];
    }
    return descArr;
}

+ (instancetype)shipTypeOrderWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name         = [LSmName nameWithDict:dict[@"name"]];
        self.types        = dict[@"types"];
        self.idLS2016     = dict[@"idLS2016"];
        self._id          = dict[@"_id"];
        self.donotcompare = dict[@"donotcompare"];
    }
    return self;
}

@end
