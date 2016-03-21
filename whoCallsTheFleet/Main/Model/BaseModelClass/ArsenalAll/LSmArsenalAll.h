//
//  LSmArsenalAll.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/15.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmArsenalAll : NSObject

@property (strong, nonatomic) NSNumber *idLS2016;
@property (strong, nonatomic) NSNumber *sort;
@property (copy, nonatomic) NSString *_id;

//生成模型
+ (NSArray<LSmArsenalAll *> *)arsenalAll;

//构造方法
+ (instancetype) arsenalAllWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
