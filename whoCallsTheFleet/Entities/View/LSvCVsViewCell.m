//
//  LSvCVsViewCell.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvCVsViewCell.h"

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmName.h"

@implementation LSvCVsViewCell

+ (instancetype)CVsViewCell:(UICollectionView *)collectionView forItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvCVsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesCVCell forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - 重写set方法

- (void)setCV:(LSmEntities *)CV
{
    _CV = CV;
}

@end //LSvCVsViewCell
