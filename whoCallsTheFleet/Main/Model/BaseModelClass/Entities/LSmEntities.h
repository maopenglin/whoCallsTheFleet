//
//  LSmEntities.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName, LSmEntitiesPicture, LSmEntitiesRelation, LSmLink;

@interface LSmEntities : NSObject

@property (strong, nonatomic, readonly) LSmName *name;
@property (strong, nonatomic, readonly) NSNumber *id;
@property (strong, nonatomic, readonly) LSmEntitiesPicture *picture;
@property (strong, nonatomic, readonly) NSArray<LSmLink *> *links;
@property (strong, nonatomic, readonly) LSmEntitiesRelation *relation;

//生成模型（单例
+ (NSArray<LSmEntities *> *)sharedEntities;

//构造方法
+ (instancetype) entitiesWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
