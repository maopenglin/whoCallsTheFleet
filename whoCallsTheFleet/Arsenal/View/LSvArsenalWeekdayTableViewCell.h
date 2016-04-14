//
//  LSvArsenalWeekdayTableViewCell.h
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/4/6.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSvArsenalWeekdayTableViewCell : UITableViewCell

/**
 *  工厂方法
 */
+ (instancetype) arsenalWeekdayTableViewCell:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath;

@end
