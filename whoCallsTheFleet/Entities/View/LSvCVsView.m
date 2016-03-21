//
//  LSvCVsView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/22.
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
        self.dataSource = self;
        self.delegate   = self;
        [self registerClass:[LSvCVsViewCell class] forCellWithReuseIdentifier:LSIdentifierEntitiesCVCell];
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
    
    cell.CV = self.CVs[indexPath.item];
    
    return cell;
}


@end //LSvCVsView
