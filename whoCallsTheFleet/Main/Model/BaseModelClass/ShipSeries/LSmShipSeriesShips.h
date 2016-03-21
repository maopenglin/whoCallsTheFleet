//
//  LSmShipSeriesShips.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmShipSeriesShips : NSObject

@property (strong, nonatomic) NSNumber *idLS2016;
@property (strong, nonatomic) NSNumber *nextLvl;
@property (strong, nonatomic) NSArray *illustExtra;
@property (copy, nonatomic) NSString *nextBlueprint;
@property (copy, nonatomic) NSString *illustDelete;

//生成模型
+ (NSArray<LSmShipSeriesShips *> *)shipSeriesShips:(NSArray<__kindof NSDictionary *> *)dictArr;

//构造方法
+ (instancetype) shipSeriesShipsWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
