//
//  LSvEntitiesIllustratorCell.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/12.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LSvEntitiesIllustratorCell : UITableViewCell

@property (nonatomic, strong) LSmEntities *illustrator;
@property (nonatomic, strong) UIColor *color;
/**
 *  快速创建cell
 */
+ (instancetype)entitiesIllustratorCell:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
