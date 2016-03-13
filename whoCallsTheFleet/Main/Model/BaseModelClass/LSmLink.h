//
//  LSmLink.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmLink : NSObject

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *url;

//生成模型
+ (NSArray<LSmLink *> *)link:(NSArray<__kindof NSDictionary *> *)dictArr;

//构造方法
+ (instancetype) linkWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
