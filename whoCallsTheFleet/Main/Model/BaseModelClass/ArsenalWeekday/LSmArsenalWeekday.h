//
//  LSmArsenalWeekday.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

//星期枚举
typedef NS_ENUM (NSUInteger, LSkWeekday){
    LSkWeekdaySunday    = 0,//周日
    LSkWeekdayMonday    = 1,//周一
    LSkWeekdayTuesday   = 2,//周二
    LSkWeekdayWednesday = 3,//周三
    LSkWeekdayThursday  = 4,//周四
    LSkWeekdayFriday    = 5,//周五
    LSkWeekdaySaturday  = 6,//周六
};

@interface LSmArsenalWeekday : NSObject

@property (nonatomic, assign) LSkWeekday weekday;
@property (nonatomic, strong) NSArray  *improvements;

//生成模型
+ (NSArray<LSmArsenalWeekday *> *)arsenalWeekday;

//构造方法
+ (instancetype) arsenalWeekdayWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
