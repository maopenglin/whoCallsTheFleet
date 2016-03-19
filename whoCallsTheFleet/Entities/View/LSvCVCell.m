//
//  LSvCVCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvCVCell.h"

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmName.h"
#import "LSmControllerAttributes.h"

@interface LSvCVCell ()

@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic, weak) IBOutlet UILabel *nameLbl;

@end

@implementation LSvCVCell

- (void)awakeFromNib
{

    self.nameLbl.textColor = LSSingleton(LSkControllerTypeEntities).color;
}

- (void)setCV:(LSmEntities *)CV
{
    _CV = CV;
    
    self.iconView.image = [UIImage imageWithData:CV.picture.avatar];
    self.nameLbl.text = CV.name.zhCn;
}

@end
