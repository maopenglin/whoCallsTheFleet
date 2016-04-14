//
//  LScArsenalAllViewController.h
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/4/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LScArsenalAllViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

/**
 *  工厂方法
 */
+ (instancetype)arsenalAllViewController;

@end
