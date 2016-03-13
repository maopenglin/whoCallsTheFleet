//
//  NSString+LSExtension.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/15.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "NSString+LSExtension.h"

@implementation NSString (LSExtension)

-(NSString *)ls_stdJsonFromDiablohuJson
{
    NSString *stdJsonStr = [self stringByReplacingOccurrencesOfString:@"}\n{" withString:@"},{"];
    
    //在字符串前后添加“[”和“]”
    stdJsonStr = [NSString stringWithFormat:@"%@%@%@",@"[",stdJsonStr,@"]"];
    
    //对字符串中需要替换的字符进行处理（暂不需要
//    stdJsonStr = stdJsonStr.ls_clearKeyword;
    
    return stdJsonStr;
}

- (NSString *)ls_clearKeyword
{
    //字符串替换词典
    NSDictionary *keywordDict = @{};
    //用以保存结果的字符串
    NSString *newStr = [NSString string];
    
    for (NSString *keywordStr in keywordDict.allKeys) {
        newStr = [self stringByReplacingOccurrencesOfString:keywordStr withString:keywordDict[keywordStr]];
    }
    
    return newStr;
}

@end
