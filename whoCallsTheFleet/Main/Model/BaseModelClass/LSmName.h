//
//  LSmName.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/16.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmName : NSObject

@property (nonatomic, copy  ) NSString *jaJp;
@property (nonatomic, copy  ) NSString *jaKana;
@property (nonatomic, copy  ) NSString *jaRomaji;
@property (nonatomic, copy  ) NSString *zhCn;
@property (nonatomic, copy  ) NSString *game;
@property (nonatomic, copy  ) NSString *code;
@property (nonatomic, copy  ) NSString *codeGame;
@property (nonatomic, copy  ) NSString *full;
@property (nonatomic, strong) NSNumber *suffix;

//构造方法
+ (instancetype) nameWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
