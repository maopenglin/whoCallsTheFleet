//
//  LSmItems.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName, LSmItemsStat, LSmItemsImprovement;

@interface LSmItems : NSObject

@property (strong, nonatomic) NSNumber *idLS2016;
@property (strong, nonatomic) NSNumber *rarity;
@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) LSmItemsStat *stat;
@property (strong, nonatomic) NSArray *dismantle;
@property (strong, nonatomic) NSArray *defaultEquippedOn;
@property (strong, nonatomic) NSNumber *timeCreated;
@property (copy, nonatomic) NSString *_id;
@property (assign, nonatomic) BOOL isCraftable;
@property (assign, nonatomic) BOOL isImprovable;
@property (strong, nonatomic) NSArray *upgradeTo;
@property (strong, nonatomic) NSNumber *timeModified;
@property (strong, nonatomic) NSArray *upgradeFrom;
@property (copy, nonatomic) NSString *rankupgradable;
@property (strong, nonatomic) NSArray<LSmItemsImprovement *> *improvement;

//生成模型
+ (NSArray<LSmItems *> *)items;

//构造方法
+ (instancetype) itemsWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
