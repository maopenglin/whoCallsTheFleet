//
//  LSvEntitiesCVCollectionView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesCVCollectionView.h"

#import "LSvEntitiesCVCell.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"

@interface LSvEntitiesCVCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation LSvEntitiesCVCollectionView

+ (instancetype)entitiesCVCollectionView
{
    //创建布局
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.itemSize                = CGSizeMake(80, 100);
    collectionViewLayout.minimumInteritemSpacing = 15;
    collectionViewLayout.minimumLineSpacing      = 20;
    collectionViewLayout.sectionInset            = UIEdgeInsetsMake(LSValueTopPadding, 20, 60, LSValueBottomPadding);
    //创建collectionView
    LSvEntitiesCVCollectionView *collectionView = [[LSvEntitiesCVCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:collectionViewLayout];
    //设置代理、属性
    collectionView.dataSource                     = collectionView;
    collectionView.delegate                       = collectionView;
    collectionView.backgroundColor                = [UIColor clearColor];
    collectionView.showsVerticalScrollIndicator   = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    //注册Cell
    UINib *collectionViewNib=[UINib nibWithNibName:@"LSvEntitiesCVCell" bundle:nil];
    [collectionView registerNib:collectionViewNib forCellWithReuseIdentifier:LSIdentifierEntitiesCVCell];
    
    return collectionView;
}

#pragma mark - Collection View Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.entitiesCV.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesCVCell *cell = [LSvEntitiesCVCell entitiesCVCell:collectionView forIndexPath:indexPath];
    
    cell.CV = self.entitiesCV[indexPath.item];
    cell.color = LSColorRandom;
    
    return cell;
}

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end
