//
//  LSmShipNamesuffix.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName;

@interface LSmShipNamesuffix : NSObject

@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) NSNumber *idLS2016;
@property (copy, nonatomic) NSString *_id;

//生成模型
+ (NSArray<LSmShipNamesuffix *> *)shipNamesuffix;

//构造方法
+ (instancetype) shipNamesuffixWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
