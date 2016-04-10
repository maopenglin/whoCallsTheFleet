//
//  LSmLink.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用于表示URL类型的枚举
 */
typedef NS_ENUM(NSUInteger, LSkLinkType) {
    LSkLinkTypeWikipedia = 0, //维基百科
    LSkLinkTypeTwitter   = 1, //推特
    LSkLinkTypeHomepage  = 2, //主页
    LSkLinkTypePixiv     = 3, //Pixiv
};

@interface LSmLink : NSObject

@property (nonatomic, assign) LSkLinkType type;
@property (nonatomic, strong) NSString    *URL;

//生成模型
+ (NSArray<LSmLink *> *)link:(NSArray<__kindof NSDictionary *> *)dictArr;

//构造方法
+ (instancetype) linkWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
