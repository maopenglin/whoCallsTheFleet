//
//  LSmShipNamesuffix.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmShipNamesuffix.h"
#import "LSmName.h"
#import "NSArray+LSJson.h"

@implementation LSmShipNamesuffix

+ (NSArray<LSmShipNamesuffix *> *)shipNamesuffix
{
    NSArray *dictArr = [NSArray ls_arrayWithContentsOfJson:@"ship_namesuffix"];
    NSMutableArray<LSmShipNamesuffix *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmShipNamesuffix *shipNamesuffix = [LSmShipNamesuffix shipNamesuffixWithDict:dict];
        [descArr addObject:shipNamesuffix];
    }
    return descArr;
}

+ (instancetype)shipNamesuffixWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name          = [[LSmName alloc] init];
        self.name.jaJp     = dict[@"ja_jp"];
        self.name.jaRomaji = dict[@"ja_romaji"];
        self.name.zhCn     = dict[@"zh_cn"];
        self.idLS2016      = dict[@"idLS2016"];
        self._id           = dict[@"_id"];
    }
    return self;
}

@end
