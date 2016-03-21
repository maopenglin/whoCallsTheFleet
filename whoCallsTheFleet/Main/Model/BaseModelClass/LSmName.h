//
//  LSmName.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmName : NSObject

@property (copy, nonatomic) NSString *jaJp;
@property (copy, nonatomic) NSString *jaKana;
@property (copy, nonatomic) NSString *jaRomaji;
@property (copy, nonatomic) NSString *zhCn;
@property (copy, nonatomic) NSString *game;
@property (copy, nonatomic) NSString *code;
@property (copy, nonatomic) NSString *codeGame;
@property (copy, nonatomic) NSString *full;
@property (strong, nonatomic) NSNumber *suffix;

//构造方法
+ (instancetype) nameWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
