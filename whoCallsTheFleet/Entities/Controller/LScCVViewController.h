//
//  LScCVViewController.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LScCVViewController : UICollectionViewController

@property (nonatomic, strong) NSArray<LSmEntities *> *CVs;
//快速创建
+ (instancetype)CVViewController;

@end
