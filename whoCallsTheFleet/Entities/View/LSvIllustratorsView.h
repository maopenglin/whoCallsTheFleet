//
//  LSvIllustratorsView.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LSvIllustratorsView : UITableView

@property (nonatomic, strong) NSArray<LSmEntities *> *illustrators;

/**
 *  工厂方法
 */
+ (instancetype)illustratorsViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;
/**
 *  工厂方法
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end //LSvIllustratorsView
