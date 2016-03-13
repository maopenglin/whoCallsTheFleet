//
//  LSmItemsImprovement.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmItemsImprovement : NSObject

@property (nonatomic, strong) NSArray *upgrade;
@property (nonatomic, strong) NSArray *req;
@property (nonatomic, strong) NSArray *resource;

//生成模型
+ (NSArray<LSmItemsImprovement *> *)itemsImprovement:(NSArray<__kindof NSDictionary *> *)dictArr;

//构造方法
+ (instancetype) itemsImprovementWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
