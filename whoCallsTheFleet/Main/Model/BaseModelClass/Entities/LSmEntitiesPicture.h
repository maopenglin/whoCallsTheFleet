//
//  LSmEntitiesPicture.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmEntitiesPicture : NSObject

@property (nonatomic, strong) NSData *avatar;

//构造方法
+ (instancetype) entitiesPictureWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
