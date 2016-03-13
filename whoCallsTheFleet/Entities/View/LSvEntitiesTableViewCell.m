//
//  LSvEntitiesTableViewCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/12.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesTableViewCell.h"

@implementation LSvEntitiesTableViewCell

+ (instancetype)entitiesTableViewCell:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierEntitiesIllustratorCell forIndexPath:indexPath];
    
    return cell;
}

@end
