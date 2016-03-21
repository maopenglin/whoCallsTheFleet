//
//  LSmEntitiesPicture.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmEntitiesPicture.h"

@implementation LSmEntitiesPicture

+(instancetype)entitiesPictureWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //读取base64字符串 去掉首部多余字符 转化为NSData
        NSString *avatarStr = dict[@"avatar"];
        if (avatarStr) {
            self.avatar = [[NSData alloc] initWithBase64EncodedString:[avatarStr substringFromIndex:23] options:NSDataBase64DecodingIgnoreUnknownCharacters];
        }
    }
    
    return self;
}

@end
