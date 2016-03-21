//
//  LSmItemsStat.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/17.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmItemsStat : NSObject

@property (strong, nonatomic) NSNumber *fire;
@property (strong, nonatomic) NSNumber *torpedo;
@property (strong, nonatomic) NSNumber *bomb;
@property (strong, nonatomic) NSNumber *asw;
@property (strong, nonatomic) NSNumber *aa;
@property (strong, nonatomic) NSNumber *armor;
@property (strong, nonatomic) NSNumber *evasion;
@property (strong, nonatomic) NSNumber *hit;
@property (strong, nonatomic) NSNumber *los;
@property (copy, nonatomic) NSString *range;

//构造方法
+ (instancetype) itemsStatWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
