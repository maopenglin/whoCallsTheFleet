//
//  LSmShipSeries.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmShipSeries.h"
#import "LSmShipSeriesShips.h"
#import "NSArray+LSJson.h"

@implementation LSmShipSeries

+ (NSArray<LSmShipSeries *> *)shipSeries
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"ship_series"];
    NSMutableArray<LSmShipSeries *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmShipSeries *shipSeries = [LSmShipSeries shipSeriesWithDict:dict];
        [descArr addObject:shipSeries];
    }
    return descArr;
}

+ (instancetype)shipSeriesWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.ships    = [LSmShipSeriesShips shipSeriesShips:dict[@"ships"]];
        self.idLS2016 = dict[@"idLS2016"];
        self._id      = dict[@"_id"];
    }
    return self;
}

@end
