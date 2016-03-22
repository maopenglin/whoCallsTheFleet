//
//  LScEntitiesDetailViewController.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/20.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScBaseViewController.h"
//#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LScEntitiesDetailViewController : LScBaseViewController

@property (nonatomic, strong) LSmEntities *entities;

/**
 *  工厂方法
 */
+ (instancetype)entitiesDetailViewController;

@end //LScEntitiesDetailViewController
