//
//  LSvCVsView.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LSvCVsView : UICollectionView

//模型数组
@property (nonatomic, strong) NSArray<LSmEntities *> *CVs;
/**
 *  选择cell时回调block
 */
@property (nonatomic, copy) void (^LSbCellDidSelect)(NSIndexPath *);

/**
 *  工厂方法
 */
+ (instancetype)CVsViewWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

@end //LSvCVsView
