//
//  LSvCVsView.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvCVsView.h"

#import "LSvCVsViewCell.h"

@interface LSvCVsView () <UICollectionViewDataSource, UICollectionViewDelegate>

@end //LSvCVsView

@implementation LSvCVsView

#pragma mark - 工厂方法

+ (instancetype)CVsViewWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    return [[self alloc] initWithFrame:frame collectionViewLayout:layout];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        //设置代理
        self.dataSource = self;
        self.delegate   = self;
        //注册cell
        [self registerNib:[UINib nibWithNibName:@"LSvCVsViewCell" bundle:nil] forCellWithReuseIdentifier:LSIdentifierEntitiesCVCell];
        //设置属性
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

#pragma mark - Collection View DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.CVs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvCVsViewCell *cell = [LSvCVsViewCell CVsViewCell:collectionView forItemAtIndexPath:indexPath];
    
    //设置数据
    cell.CV = self.CVs[indexPath.item];
    
    return cell;
}

#pragma mark - Collection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //调用Block
    self.LSbCellDidSelect(indexPath);
}

@end //LSvCVsView
