//
//  LSmShipTypeCollections.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName;

@interface LSmShipTypeCollections : NSObject

@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) NSArray *types;
@property (strong, nonatomic) NSNumber *idLS2016;
@property (copy, nonatomic) NSString *_id;

//生成模型
+ (NSArray<LSmShipTypeCollections *> *)shipTypeCollections;

//构造方法
+ (instancetype) shipTypeCollectionsWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
