//
//  LSmItemTypeCollections.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmItemTypeCollections.h"
#import "LSmName.h"
#import "NSArray+LSJson.h"

@implementation LSmItemTypeCollections

+ (NSArray<LSmItemTypeCollections *> *)itemTypeCollections
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"item_type_collections"];
    NSMutableArray<LSmItemTypeCollections *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmItemTypeCollections *itemTypeCollections = [LSmItemTypeCollections itemTypeCollectionsWithDict:dict];
        [descArr addObject:itemTypeCollections];
    }
    return descArr;
}

+ (instancetype)itemTypeCollectionsWithDict:(NSDictionary *)dict
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
