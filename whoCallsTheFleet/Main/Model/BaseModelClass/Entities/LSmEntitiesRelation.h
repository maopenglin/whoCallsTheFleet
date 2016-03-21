//
//  LSmEntitiesRelation.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmEntitiesRelation : NSObject

@property (strong, nonatomic) NSArray *cv;
@property (strong, nonatomic) NSArray *illustrator;

//构造方法
+ (instancetype) entitiesRelationWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
