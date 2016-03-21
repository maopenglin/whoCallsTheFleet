//
//  LSmItemTypes.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSmName;

@interface LSmItemTypes : NSObject

@property (strong, nonatomic) LSmName *name;
@property (strong, nonatomic) NSNumber *icon;
@property (strong, nonatomic) NSArray *equipableOnType;
@property (strong, nonatomic) NSNumber *idLS2016;
@property (copy, nonatomic) NSString *_id;
@property (copy, nonatomic) NSString *mainAttribute;

//生成模型
+ (NSArray<LSmItemTypes *> *)itemTypes;

//构造方法
+ (instancetype) itemTypesWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
