//
//  LSvEntitiesCollectionViewCell.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/12.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LSvEntitiesCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) LSmEntities *CV;
@property (nonatomic, strong) UIColor *color;
/**
 *  快速创建cell
 */
+ (instancetype)entitiesCollectionViewCell:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
