//
//  LSmItemTypeCollections.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName;

@interface LSmItemTypeCollections : NSObject

@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) NSArray *types;
@property (strong, nonatomic) NSNumber *idLS2016;
@property (copy, nonatomic) NSString *_id;

//生成模型
+ (NSArray<LSmItemTypeCollections *> *)itemTypeCollections;

//构造方法
+ (instancetype) itemTypeCollectionsWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
