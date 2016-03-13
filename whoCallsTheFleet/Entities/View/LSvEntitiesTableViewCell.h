//
//  LSvEntitiesTableViewCell.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/12.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSvEntitiesTableViewCell : UITableViewCell

/**
 *  快速创建cell
 */
+ (instancetype)entitiesTableViewCell:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
