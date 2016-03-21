//
//  LSmShipSeries.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmShipSeriesShips;

@interface LSmShipSeries : NSObject

@property (strong, nonatomic) NSArray<LSmShipSeriesShips *> *ships;
@property (strong, nonatomic) NSNumber *idLS2016;
@property (copy, nonatomic) NSString *_id;

//生成模型
+ (NSArray<LSmShipSeries *> *)shipSeries;

//构造方法
+ (instancetype) shipSeriesWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
