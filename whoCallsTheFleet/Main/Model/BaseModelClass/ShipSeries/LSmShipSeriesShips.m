//
//  LSmShipSeriesShips.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmShipSeriesShips.h"

@implementation LSmShipSeriesShips

+(NSArray<LSmShipSeriesShips *> *)shipSeriesShips:(NSArray<__kindof NSDictionary *> *)dictArr
{
    NSMutableArray<LSmShipSeriesShips *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmShipSeriesShips *shipSeriesShips = [LSmShipSeriesShips shipSeriesShipsWithDict:dict];
        [descArr addObject:shipSeriesShips];
    }
    return descArr;
}

+(instancetype)shipSeriesShipsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.idLS2016 = dict[@"idLS2016"];
        self.nextLvl = dict[@"next_lvl"];
        self.illustExtra = dict[@"illust_extra"];
        self.nextBlueprint = dict[@"next_blueprint"];
        self.illustDelete = dict[@"illust_delete"];
    }
    return self;
}

@end
