//
//  LSvCVsViewCell.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities, LSvCVsView;

@interface LSvCVsViewCell : UICollectionViewCell

@property (nonatomic, strong) LSmEntities *CV;

+ (instancetype)CVsViewCell:(UICollectionView *)collectionView forItemAtIndexPath:(NSIndexPath *)indexPath;

@end //LSvCVsViewCell
