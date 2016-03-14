//
//  LSvEntitiesCVCollectionView.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LSvEntitiesCVCollectionView : UICollectionView

//模型数组
@property (nonatomic, strong) NSArray<LSmEntities *> *entitiesCV;

/**
 *  快速创建
 */
+ (instancetype)entitiesCVCollectionView;

@end
