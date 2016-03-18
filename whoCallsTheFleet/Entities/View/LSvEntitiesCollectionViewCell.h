//
//  LSvEntitiesCollectionViewCell.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSvEntitiesCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIViewController *entitiesVc;

/**
 *  快速创建
 */
+ (instancetype)entitiesCollectionViewCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
