//
//  NSString+LSFilePath.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/1/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "NSString+LSFilePath.h"

@implementation NSString (LSFilePath)

+(instancetype)ls_filePathInFolder:(NSString *)folder andFile:(NSString *)fileName andType:(NSString *)type
{
    return [NSString stringWithFormat:@"%@/%@/%@.%@",[NSBundle mainBundle].bundlePath,folder,fileName,type];
}

+ (instancetype)ls_pathOfDbFile:(NSString *)dbFile
{
    return [self ls_filePathInFolder:@"" andFile:dbFile andType:@"json"];
}

+ (instancetype)ls_pathOfItemPictureWithID:(NSString *)itemID
{
    return [self ls_filePathInFolder:[NSString stringWithFormat:@"pics/items/%@",itemID] andFile:@"card" andType:@"webp"];
}

+ (instancetype)ls_pathOfShipPictureWithID:(NSString *)shipID andStatue:(NSString *)status
{
    return [self ls_filePathInFolder:[NSString stringWithFormat:@"pics/ships/%@",shipID] andFile:status andType:@"webp"];
}

@end
