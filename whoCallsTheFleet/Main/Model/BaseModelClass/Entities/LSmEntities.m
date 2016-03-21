//
//  LSmEntities.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmEntities.h"
#import "LSmName.h"
#import "LSmEntitiesPicture.h"
#import "LSmLink.h"
#import "LSmEntitiesRelation.h"
#import "NSArray+LSJson.h"

@interface LSmEntities ()

@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) NSNumber *id;
@property (strong, nonatomic) LSmEntitiesPicture *picture;
@property (strong, nonatomic) NSArray<LSmLink *> *links;
@property (strong, nonatomic) LSmEntitiesRelation *relation;

@end

@implementation LSmEntities

+(NSArray<LSmEntities *> *)sharedEntities
{
    static NSArray<LSmEntities *> *descArr = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"entities"];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in dictArr) {
            LSmEntities *entities = [LSmEntities entitiesWithDict:dict];
            [tempArr addObject:entities];
        }
        descArr = tempArr;
    });
    
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
    }
    return self;
}
@end
