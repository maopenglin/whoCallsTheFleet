//
//  LSmShipTypeOrder.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName;

@interface LSmShipTypeOrder : NSObject

@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) NSArray *types;
@property (strong, nonatomic) NSNumber *idLS2016;
@property (copy, nonatomic) NSString *_id;
@property (copy, nonatomic) NSString *donotcompare;

//生成模型
+ (NSArray<LSmShipTypeOrder *> *)shipTypeOrder;

//构造方法
+ (instancetype) shipTypeOrderWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
