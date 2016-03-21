//
//  LSmItemsStat.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/17.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmItemsStat.h"

@implementation LSmItemsStat

+ (instancetype)itemsStatWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
