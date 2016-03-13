//
//  LSmEntities.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName, LSmEntitiesPicture, LSmEntitiesRelation, LSmLink;

@interface LSmEntities : NSObject

@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) NSNumber *id;
@property (strong, nonatomic) LSmEntitiesPicture *picture;
@property (strong, nonatomic) NSArray<LSmLink *> *links;
@property (strong, nonatomic) LSmEntitiesRelation *relation;
//@property (copy, nonatomic) NSString *_id;

//生成模型
+ (NSArray<LSmEntities *> *)entities;

//构造方法
+ (instancetype) entitiesWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
