//
//  LSvEntitiesCollectionView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesCollectionView.h"

#import "LSvEntitiesCollectionViewFlowLayout.h"

@implementation LSvEntitiesCollectionView

+ (instancetype)entitiesCollectionViewWithCellSize:(CGSize)cellSize
{
    //布局
    LSvEntitiesCollectionViewFlowLayout *collectionViewLayout = [LSvEntitiesCollectionViewFlowLayout entitiesCollectionViewFlowLayoutWithCellSize:cellSize];
    //创建
    LSvEntitiesCollectionView *entitiesCollectionView = [[LSvEntitiesCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:collectionViewLayout];
    //基本属性
    entitiesCollectionView.showsVerticalScrollIndicator   = NO;
    entitiesCollectionView.showsHorizontalScrollIndicator = NO;
    entitiesCollectionView.bounces                        = NO;
    entitiesCollectionView.pagingEnabled                  = YES;
    entitiesCollectionView.backgroundColor                = [UIColor clearColor];
    
    return entitiesCollectionView;
}
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end
