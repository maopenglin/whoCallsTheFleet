//
//  LSmItem.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/4.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSmOptionItem : NSObject

@property (nonatomic, copy) NSString *describe;
@property (nonatomic, assign) Class accessoryClass;
@property (nonatomic, strong) NSString *value;

//工厂方法
+ (instancetype)optionItemWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 *  提供optionItem模型数组
 */
+ (NSMutableArray<LSmOptionItem *> *)optionItems:(NSArray<__kindof NSDictionary *> *)dictArr;
/**
 *  提供optionItem字典数组
 */
+ (NSArray<NSDictionary *> *)toDicts:(NSMutableArray<LSmOptionItem *> *)optionItems;
@end
