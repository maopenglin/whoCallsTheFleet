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

//模型数组
@property (nonatomic, strong) NSArray<LSmEntities *> *illustrators;
/**
 *  选择cell时回调block
 */
@property (nonatomic, copy) void (^LSbCellDidSelect)(NSIndexPath *);

/**
 *  工厂方法
 */
+ (instancetype)illustratorsViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;
/**
 *  工厂方法
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end //LSvIllustratorsView
