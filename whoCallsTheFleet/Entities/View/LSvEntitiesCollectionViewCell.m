//
//  LSvEntitiesCollectionViewCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesCollectionViewCell.h"

#import "LSvEntitiesCVCollectionView.h"
#import "LSvEntitiesIllustratorTableView.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"


@interface LSvEntitiesCollectionViewCell ()

@property (nonatomic, strong) NSArray<LSmEntities *> *entitiesCV;
@property (nonatomic, strong) NSArray<LSmEntities *> *entitiesIllustrator;

@end

@implementation LSvEntitiesCollectionViewCell

+ (instancetype)entitiesCollectionViewCell:(UICollectionView *)collectionView forItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesMainCell forIndexPath:indexPath];
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 150)];
//    [cell addSubview:view];
    switch (indexPath.item) {
        case LSkEntitiesTypeCV:{
            LSvEntitiesCVCollectionView *CVView = [LSvEntitiesCVCollectionView entitiesCVCollectionView];
            
            CVView.entitiesCV = nil;
            CVView.entitiesCV = cell.entitiesCV;
            
            [cell addSubview:CVView];
            break;
        }
        case LSkEntitiesTypeIllustrator:{
            LSvEntitiesIllustratorTableView *illustratorView = [LSvEntitiesIllustratorTableView entitienIllustratorTableView];
            
            illustratorView.entitiesIllustrator = nil;
            illustratorView.entitiesIllustrator = cell.entitiesIllustrator;
            
            [cell addSubview:illustratorView];
            break;
        }
            
        default:
            break;
    }
    
    return cell;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *view in self.subviews) {
        view.frame = self.bounds;
    }
}

#pragma mark - Lazy Load

- (NSArray<LSmEntities *> *)entitiesCV
{
    if (!_entitiesCV) {
        //获取数据
        NSArray<LSmEntities *> *tempArr = [LSmEntities entities];
        //新建空的数组
        NSMutableArray<LSmEntities *> *descArr = [NSMutableArray array];
        for (LSmEntities *entities in tempArr) {
            if (entities.relation.cv) {
                [descArr addObject:entities];
            };
        }
        _entitiesCV = descArr;
    }
    return _entitiesCV;
}
- (NSArray<LSmEntities *> *)entitiesIllustrator
{
    if (!_entitiesIllustrator) {
        //获取数据
        NSArray<LSmEntities *> *tempArr = [LSmEntities entities];
        //新建空的数组
        NSMutableArray<LSmEntities *> *descArr = [NSMutableArray array];
        for (LSmEntities *entities in tempArr) {
            if (entities.relation.illustrator) {
                [descArr addObject:entities];
            };
        }
        _entitiesIllustrator = descArr;
    }
    return _entitiesIllustrator;
}

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end
