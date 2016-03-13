//
//  LSmArsenalWeekday.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmArsenalWeekday : NSObject

@property (strong, nonatomic) NSNumber *weekday;
@property (strong, nonatomic) NSArray *improvements;
@property (copy, nonatomic) NSString *_id;

//生成模型
+ (NSArray<LSmArsenalWeekday *> *)arsenalWeekday;

//构造方法
+ (instancetype) arsenalWeekdayWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
