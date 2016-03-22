//
//  LScBaseViewController.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSmControllerAttributes.h"

@interface LScBaseViewController : UIViewController

//控制器属性表
@property (nonatomic, strong) LSmControllerAttributes *controllerAttribute;

/**
 *  工厂方法
 */
+ (instancetype)baseViewController;
/**
 *  工厂方法
 */
- (instancetype)init;

@end //LScBaseViewController
