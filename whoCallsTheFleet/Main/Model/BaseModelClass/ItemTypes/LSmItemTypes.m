//
//  LSmItemTypes.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmItemTypes.h"
#import "LSmName.h"
#import "NSArray+LSJson.h"

@implementation LSmItemTypes
+ (NSArray<LSmItemTypes *> *)itemTypes
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"item_types"];
    NSMutableArray<LSmItemTypes *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmItemTypes *itemTypes = [LSmItemTypes itemTypesWithDict:dict];
        [descArr addObject:itemTypes];
    }
    return descArr;
}

+ (instancetype)itemTypesWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name            = [LSmName nameWithDict:dict[@"name"]];
        self.icon            = dict[@"icon"];
        self.equipableOnType = dict[@"equipable_on_type"];
        self.idLS2016        = dict[@"idLS2016"];
        self._id             = dict[@"_id"];
        self.mainAttribute   = dict[@"main_attribute"];
    }
    return self;
}
@end
