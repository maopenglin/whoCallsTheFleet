//
//  LSmItems.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmItems.h"
#import "LSmName.h"
#import "LSmItemsStat.h"
#import "LSmItemsImprovement.h"
#import "NSArray+LSJson.h"

@implementation LSmItems

+ (NSArray<LSmItems *> *)items
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"items"];
    NSMutableArray<LSmItems *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmItems *items = [LSmItems itemsWithDict:dict];
        [descArr addObject:items];
    }
    return descArr;
}

+ (instancetype) itemsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype) initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.idLS2016          = dict[@"idLS2016"];
        self.rarity            = dict[@"rarity"];
        self.type              = dict[@"type"];
        self.name              = [LSmName nameWithDict:dict[@"name"]];
        self.stat              = [LSmItemsStat itemsStatWithDict:dict[@"stat"]];
        self.dismantle         = dict[@"dismantle"];
        self.defaultEquippedOn = dict[@"default_equipped_on"];
        self.timeCreated       = dict[@"time_created"];
        self._id               = dict[@"_id"];
        self.isCraftable       = ((NSNumber *)dict[@"craftable"]).boolValue;
        self.isImprovable      = ((NSNumber *)dict[@"improvable"]).boolValue;
        self.upgradeTo         = dict[@"upgrade_to"];
        self.timeModified      = dict[@"time_modified"];
        self.upgradeFrom       = dict[@"upgrade_from"];
        self.rankupgradable    = dict[@"rankupgradable"];
        
        //判断是否为可改修装备
        if (self.isImprovable) {
            self.improvement   = [LSmItemsImprovement itemsImprovement:dict[@"improvement"]];
        }
    }
    return self;
}

@end
