//
//  LScIllustratorViewController.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LScIllustratorViewController : UITableViewController

@property (nonatomic, strong) NSArray<LSmEntities *> *illustrators;
/**
 *  快速创建
 */
+ (instancetype)illustratorViewController;

@end
