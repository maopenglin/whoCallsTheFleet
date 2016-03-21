//
//  LSmName.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmName.h"

@implementation LSmName

+(instancetype)nameWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.jaJp     = dict[@"ja_jp"];
        self.zhCn     = dict[@"zh_cn"];
        self.jaKana   = dict[@"ja_kana"];
        self.jaRomaji = dict[@"ja_romaji"];
        self.game     = dict[@"game"];
        self.suffix   = dict[@"suffix"];
    }
    return self;
}

@end
