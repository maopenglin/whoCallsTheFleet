//
//  LSvOptionTableViewCell.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmOptionItem;

@interface LSvOptionTableViewCell : UITableViewCell

//数据模型
@property (nonatomic, strong) LSmOptionItem *optionItem;

//子控件
@property (nonatomic, weak) UITextField *accessoryTxt;
@property (nonatomic, weak) UISwitch *accessorySwc;

//回调block
@property (nonatomic, copy) void (^LSbAccessoryValueChanged)(NSString *value);

/**
 *  快速创建cell
 */
+ (instancetype)optionTableViewCell:(UITableView *)tableView;

@end
