//
//  LSmLink.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmLink.h"

@implementation LSmLink

+(NSArray<LSmLink *> *)link:(NSArray<__kindof NSDictionary *> *)dictArr
{
    NSMutableArray<LSmLink *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmLink *link = [LSmLink linkWithDict:dict];
        [descArr addObject:link];
    }
    return descArr;
}

+(instancetype)linkWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.url  = [NSURL URLWithString:dict[@"url"]];
    }
    return self;
}

@end
