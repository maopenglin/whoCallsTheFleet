//
//  NSArray+LSJson.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/15.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "NSArray+LSJson.h"
#import "NSString+LSFilePath.h"
#import "NSString+LSExtension.h"

@implementation NSArray (LSJson)

+(instancetype)ls_arrayWithContentsOfJson:(NSString *)fileName
{
    //获取文件路径
    NSString *path = [NSString ls_pathOfDbFile:fileName];
    //json->UTF8字符串
    NSString *jsonStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //字符串标准化
    jsonStr = jsonStr.ls_stdJsonFromDiablohuJson;
    //UTF8字符串->二进制data
    NSData *temp = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    //二进制data->数组
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:temp options:kNilOptions error:nil];
    
    return jsonArr;
}

@end
