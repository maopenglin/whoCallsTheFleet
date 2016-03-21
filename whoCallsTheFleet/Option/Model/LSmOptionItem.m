//
//  LSmItem.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/4.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmOptionItem.h"

@implementation LSmOptionItem

+ (NSMutableArray<LSmOptionItem *> *)optionItems:(NSArray<__kindof NSDictionary *> *)dictArr
{
    NSMutableArray<LSmOptionItem *> *descArr = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        LSmOptionItem *optionsItem = [LSmOptionItem optionItemWithDict:dict];
        [descArr addObject:optionsItem];
    }
    return descArr;
}
+ (NSArray<NSDictionary *> *)toDicts:(NSMutableArray<LSmOptionItem *> *)optionItems
{
    NSMutableArray<NSDictionary *> *dictArr = [NSMutableArray array];
    
    for (LSmOptionItem *optionItem in optionItems) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"describe"]       = optionItem.describe;
        dict[@"accessoryClass"] = NSStringFromClass(optionItem.accessoryClass);
        dict[@"value"]          = optionItem.value;
        
        [dictArr addObject:dict];
    }
    
    return dictArr;
}

+ (instancetype)optionItemWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.describe       = dict[@"describe"];
        self.accessoryClass = NSClassFromString((NSString *)dict[@"accessoryClass"]);
        self.value          = dict[@"value"];
    }
    return self;
}

@end