//
//  LSvEntitiesCVCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/12.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesCVCell.h"

#import <QuartzCore/QuartzCore.h>

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmName.h"

@interface LSvEntitiesCVCell ()

@property (nonatomic, weak) IBOutlet UIImageView *pictureView;
@property (nonatomic, weak) IBOutlet UILabel *nameView;

@end

@implementation LSvEntitiesCVCell

+ (instancetype)entitiesCVCell:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesCVCell forIndexPath:indexPath];
    
    return cell;
}

- (void)awakeFromNib
{
    //设置姓名版格式
    self.nameView.textAlignment = NSTextAlignmentCenter;
    self.nameView.font          = LSFontWithSize(14);
    //设置圆角头像
//    CALayer *layer = self.pictureView.layer;
//    layer.cornerRadius = 15;
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

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end
