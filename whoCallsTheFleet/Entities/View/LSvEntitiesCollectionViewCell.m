//
//  LSvEntitiesCollectionViewCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/12.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesCollectionViewCell.h"

#import <QuartzCore/QuartzCore.h>

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmName.h"

@interface LSvEntitiesCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *pictureView;
@property (nonatomic, weak) IBOutlet UILabel *nameView;

@end

@implementation LSvEntitiesCollectionViewCell

+ (instancetype)entitiesCollectionViewCell:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesCVCell forIndexPath:indexPath];
    
    return cell;
}

- (void)awakeFromNib
{
    //设置姓名版格式
    self.nameView.textAlignment = NSTextAlignmentCenter;
    self.nameView.font          = LSFontWithSize(14);
//    self.nameView.backgroundColor = LSColorWithRGBA(100, 100, 100, 1);
    //设置圆角头像
    CALayer *layer = self.pictureView.layer;
    layer.cornerRadius = 15;
}

#pragma mark - 重写set方法

- (void)setCV:(LSmEntities *)CV
{
    _CV = CV;
    
    //给控件赋值
    self.pictureView.image      = [UIImage imageWithData:CV.picture.avatar];
    self.nameView.text          = CV.name.zhCn;
}
- (void)setColor:(UIColor *)color
{
    _color = color;

    self.nameView.textColor     = color;
}

@end
