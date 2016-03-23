//
//  LSvIllustratorsViewCell.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvIllustratorsViewCell.h"

#import "LSmEntities.h"
#import "LSmName.h"
#import "LSmControllerAttributes.h"

@interface LSvIllustratorsViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *nameLbl;
@property (nonatomic, weak) IBOutlet UIImageView *arrowView;
@property (nonatomic, weak) IBOutlet UIView *lineView;

@end //LSvIllustratorsViewCell

@implementation LSvIllustratorsViewCell

+ (instancetype)illustratorViewCell:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvIllustratorsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierEntitiesIllustratorCell forIndexPath:indexPath];
    
    //设置选择效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - 重写setfangf

- (void)setIllustrator:(LSmEntities *)illustrator
{
    _illustrator = illustrator;
    
    //设置内容
    self.nameLbl.text    = illustrator.name.zhCn;
    self.arrowView.image = [[UIImage imageNamed:@"arrowIcon"] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    
    //设置颜色
    UIColor *color = LSSingletonControllerAttributes(LSkControllerTypeEntities).color;
    self.nameLbl.textColor        = color;
    self.arrowView.tintColor      = color;
    self.lineView.backgroundColor = color;
}

@end //LSvIllustratorsViewCell
