//
//  LSvIllustratorsViewCell.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LSvIllustratorsViewCell : UITableViewCell

@property (nonatomic, strong) LSmEntities *illustrator;

+ (instancetype)illustratorViewCell:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath;

@end //LSvIllustratorsViewCell
