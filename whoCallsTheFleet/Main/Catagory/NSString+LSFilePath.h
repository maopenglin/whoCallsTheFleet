//
//  NSString+LSFilePath.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSFilePath)

/**
 *  获取某文件的全路径
 *
 *  @param folders    在bundle中的子文件夹名，可以多层
 *  @param fileName   文件名
 *  @param type       文件类型
 *
 *  @return 全路径
 */
+ (instancetype)ls_filePathInFolder:(NSString *)folder andFile:(NSString *)fileName andType:(NSString *)type;
/**
 *  获取某json数据文件的全路径
 *
 *  @param dbFile 文件名
 *
 *  @return 全路径
 */
+ (instancetype)ls_pathOfDbFile:(NSString *)dbFile;
/**
 *  获取某物品图片的全路径
 *
 *  @param itemID  物品ID
 *
 *  @return 路径
 */
+ (instancetype)ls_pathOfItemPictureWithID:(NSString *)itemID;
/**
 *  获取某船只图片的全路径
 *
 *  @param shipID  船只ID
 *  @param picture 图片类型（正常、大破、姓名版等）
 *
 *  @return 路径
 */
+ (instancetype)ls_pathOfShipPictureWithID:(NSString *)shipID andStatue:(NSString *)status;

@end
