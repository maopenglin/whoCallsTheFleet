//
//  LSvEntitiesCollectionViewCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesCollectionViewCell.h"

@implementation LSvEntitiesCollectionViewCell

+ (instancetype)entitiesCollectionViewCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesMainCell forIndexPath:indexPath];
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.entitiesVc.view.frame = self.bounds;
}

- (void)setEntitiesVc:(UIViewController *)entitiesVc
{
    _entitiesVc = entitiesVc;
    
    
    [self addSubview:entitiesVc.view];
}

@end
