//
//  LSmShipTypeCollections.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmShipTypeCollections.h"
#import "LSmName.h"
#import "NSArray+LSJson.h"

@implementation LSmShipTypeCollections

+ (NSArray<LSmShipTypeCollections *> *)shipTypeCollections
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"ship_type_collections"];
    NSMutableArray<LSmShipTypeCollections *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmShipTypeCollections *shipTypeCollections = [LSmShipTypeCollections shipTypeCollectionsWithDict:dict];
        [descArr addObject:shipTypeCollections];
    }
    return descArr;
}

+ (instancetype)shipTypeCollectionsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name     = [LSmName nameWithDict:dict[@"name"]];
        self.types    = dict[@"types"];
        self.idLS2016 = dict[@"idLS2016"];
        self._id      = dict[@"_id"];
    }
    return self;
}

@end
