//
//  LSmOption.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/4.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmOption.h"
#import "LSmOptionItem.h"
#import "NSString+LSFilePath.h"

@implementation LSmOption

+ (NSMutableArray<LSmOption *> *)options:(NSString *)plistPath
{
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray<LSmOption *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmOption *option = [LSmOption optionWithDict:dict];
        [descArr addObject:option];
    }
    return descArr;
}
+ (NSArray<NSDictionary *> *)toDicts:(NSMutableArray<LSmOption *> *)options
{
    NSMutableArray<NSDictionary *> *dictArr = [NSMutableArray array];
    
    for (LSmOption *option in options) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"items"] =[LSmOptionItem toDicts:option.items];
        dict[@"title"] = option.title;
        
        [dictArr addObject:dict];
    }
    return dictArr;
}

+ (instancetype)optionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.items = [LSmOptionItem optionItems:dict[@"items"]];
        self.title = dict[@"title"];
    }
    return self;
}

@end
