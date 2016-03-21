//
//  NSArray+LSJson.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/15.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LSJson)

/**
 *  返回某个json转化的数组
 *
 *  @param fileName json文件的名字
 *
 *  @return 字典
 */
+ (instancetype) ls_arrayWithContentsOfJson:(NSString *)fileName;

@end
