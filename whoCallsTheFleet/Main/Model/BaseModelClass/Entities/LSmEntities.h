//
//  LSmEntities.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用于表示声优或是画师的枚举
 */
typedef NS_ENUM(NSUInteger, LSkEntitiesType) {
    LSkEntitiesTypeCV          = 0,//声优
    LSkEntitiesTypeIllustrator = 1,//画师
};

@class LSmName, LSmEntitiesPicture, LSmLink;

@interface LSmEntities : NSObject

@property (strong, nonatomic, readonly) LSmName *name;
@property (strong, nonatomic, readonly) NSNumber *id;
@property (strong, nonatomic, readonly) LSmEntitiesPicture *picture;
@property (strong, nonatomic, readonly) NSArray<LSmLink *> *links;
@property (strong, nonatomic, readonly) NSArray<NSArray<NSNumber *> *> *relation;
@property (assign, nonatomic, readonly) LSkEntitiesType type;

//生成模型（单例
+ (NSArray<LSmEntities *> *)sharedEntities;

//构造方法
+ (instancetype) entitiesWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
