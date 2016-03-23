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
#import "LSmControllerAttributes.h"

@interface LSvCVsViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic, weak) IBOutlet UILabel *nameLbl;

@end //LSvCVsViewCell

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
    
    //设置内容
    self.iconView.image = [UIImage imageWithData:CV.picture.avatar];
    self.nameLbl.text   = CV.name.zhCn;
    
    //设置颜色
    UIColor *color = LSSingletonControllerAttributes(LSkControllerTypeEntities).color;
    self.nameLbl.textColor = color;
}

@end //LSvCVsViewCell
