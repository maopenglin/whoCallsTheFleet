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

@implementation LSvIllustratorsViewCell

+ (instancetype)illustratorViewCell:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvIllustratorsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierEntitiesIllustratorCell forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - 重写setfangf

- (void)setIllustrator:(LSmEntities *)illustrator
{
    _illustrator = illustrator;
    
    self.textLabel.text = illustrator.name.zhCn;
}

@end //LSvIllustratorsViewCell
