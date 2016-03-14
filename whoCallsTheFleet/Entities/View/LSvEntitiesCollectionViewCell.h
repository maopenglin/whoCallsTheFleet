//
//  LSvEntitiesCollectionViewCell.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, LSkEntitiesType){
    LSkEntitiesTypeCV          = 0,//声优
    LSkEntitiesTypeIllustrator = 1 //画师
};

@interface LSvEntitiesCollectionViewCell : UICollectionViewCell

//快速创建
+ (instancetype)entitiesCollectionViewCell:(UICollectionView *)collectionView forItemAtIndexPath:(NSIndexPath *)indexPath;

@end
