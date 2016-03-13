//
//  LSmEntities.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmEntities.h"
#import "LSmName.h"
#import "LSmEntitiesPicture.h"
#import "LSmLink.h"
#import "LSmEntitiesRelation.h"
#import "NSArray+LSJson.h"

@implementation LSmEntities

+(NSArray<LSmEntities *> *)entities
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"entities"];
    NSMutableArray<LSmEntities *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmEntities *entities = [LSmEntities entitiesWithDict:dict];
        [descArr addObject:entities];
    }
    return descArr;
}

+(instancetype)entitiesWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name     = [LSmName nameWithDict:dict[@"name"]];
        self.id       = dict[@"id"];
        self.picture  = [LSmEntitiesPicture entitiesPictureWithDict:dict[@"picture"]];
        self.links    = [LSmLink link:dict[@"links"]];
        self.relation = [LSmEntitiesRelation entitiesRelationWithDict:dict[@"relation"]];
//        self._id      = dict[@"_id"];
    }
    return self;
}
@end
