//
//  LSvIllustratorCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvIllustratorCell.h"

#import "LSmEntities.h"
#import "LSmName.h"
#import "LSmControllerAttributes.h"

@interface LSvIllustratorCell ()

@property (nonatomic, weak) IBOutlet UILabel *nameLbl;
@property (nonatomic, weak) IBOutlet UIView *lineView;

@end

@implementation LSvIllustratorCell

- (void)awakeFromNib
{
    self.nameLbl.textColor        = LSSingleton(LSkControllerTypeEntities).color;
    self.lineView.backgroundColor = LSSingleton(LSkControllerTypeEntities).color;
}

- (void)setIllustrator:(LSmEntities *)illustrator
{
    _illustrator = illustrator;
    
    self.nameLbl.text = illustrator.name.zhCn;
}

@end
