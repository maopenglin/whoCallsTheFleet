//
//  NSString+LSExtension.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/15.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSExtension)

/**
 *  转化大波胡json为标准json格式
 */
@property (nonatomic, readonly, copy) NSString *ls_stdJsonFromDiablohuJson;
/**
 *  清理替换与关键字冲突的字符串内容
 */
@property (nonatomic, readonly, copy) NSString *ls_clearKeyword;

@end
