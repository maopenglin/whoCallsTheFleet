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

@property (nonatomic, strong) NSArray<LSmEntities *> *CVs;

/**
 *  工厂方法
 */
+ (instancetype)CVsViewWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;
/**
 *  工厂方法
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

@end //LSvCVsView
