//
//  LSvArsenalWeekdayTableViewCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/4/6.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvArsenalWeekdayTableViewCell.h"

@implementation LSvArsenalWeekdayTableViewCell

#pragma mark - 工厂方法

+ (instancetype)arsenalWeekdayTableViewCell:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvArsenalWeekdayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierArsenalCell forIndexPath:indexPath];
    
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
