//
//  LSmShipTypes.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName;

@interface LSmShipTypes : NSObject

@property (strong, nonatomic) NSNumber *idLS2016;
@property (strong, nonatomic) LSmName *name;
@property (copy, nonatomic) NSString *_id;
@property (strong, nonatomic) NSArray *equipable;

//生成模型
+ (NSArray<LSmShipTypes *> *)shipTypes;

//构造方法
+ (instancetype) shipTypesWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
