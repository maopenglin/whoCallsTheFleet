//
//  LSvEntitiesCollectionViewFlowLayout.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesCollectionViewFlowLayout.h"

@implementation LSvEntitiesCollectionViewFlowLayout

+ (instancetype)entitiesCollectionViewFlowLayoutWithCellSize:(CGSize)cellSize
{
    //创建
    LSvEntitiesCollectionViewFlowLayout *collectionViewLayout = [[LSvEntitiesCollectionViewFlowLayout alloc] init];
    //设置属性
    collectionViewLayout.itemSize                = CGSizeMake(cellSize.width, cellSize.height - 88);
    collectionViewLayout.minimumInteritemSpacing = 0;
    collectionViewLayout.minimumLineSpacing      = 0;
    collectionViewLayout.scrollDirection         = UICollectionViewScrollDirectionHorizontal;
    
    return collectionViewLayout;
}

@end
