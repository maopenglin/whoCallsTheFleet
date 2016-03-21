//
//  LSmShipTypes.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmShipTypes.h"
#import "LSmName.h"
#import "NSArray+LSJson.h"

@implementation LSmShipTypes

+ (NSArray<LSmShipTypes *> *)shipTypes
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"ship_types"];
    NSMutableArray<LSmShipTypes *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmShipTypes *shipTypes = [LSmShipTypes shipTypesWithDict:dict];
        [descArr addObject:shipTypes];
    }
    return descArr;
}

+ (instancetype)shipTypesWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name          = [[LSmName alloc] init];
        self.name.code     = dict[@"code"];
        self.name.codeGame = dict[@"code_game"];
        self.name.full     = dict[@"full"];
        self.name.jaJp     = dict[@"full_game"];
        self.name.zhCn     = dict[@"full_zh"];
        self.idLS2016      = dict[@"idLS2016"];
        self._id           = dict[@"_id"];
        self.equipable     = dict[@"equipable"];
    }
    return self;
}

@end
