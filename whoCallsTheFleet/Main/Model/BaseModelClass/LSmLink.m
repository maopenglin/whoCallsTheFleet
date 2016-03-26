//
//  LSmLink.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
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
        if ([dict[@"name"] isEqualToString:@"Wikipedia"]) {
            self.type = LSkLinkTypeWikipedia;
        } else if ([dict[@"name"] isEqualToString:@"Twitter"]) {
            self.type = LSkLinkTypeTwitter;
        } else if ([dict[@"name"] isEqualToString:@"Homepage"]) {
            self.type = LSkLinkTypeHomepage;
        } else if ([dict[@"name"] isEqualToString:@"Pixiv"]) {
            self.type = LSkLinkTypePixiv;
        }
        self.URL = dict[@"url"];
    }
    return self;
}

@end
