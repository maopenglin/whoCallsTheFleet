//
//  LScCVViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScCVViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"

#import "LSvCVCell.h"

@class LSvEntitiesCollectionViewCell, LSvEntitiesCollectionView;

@interface LScCVViewController ()

@property (nonatomic, strong) NSArray<LSmEntities *> *CVs;

@end

@implementation LScCVViewController

+ (instancetype)CVViewController
{
    UIStoryboard *CVSb = [UIStoryboard storyboardWithName:@"LScCVViewController" bundle:nil];
    
    return CVSb.instantiateInitialViewController;
}

#pragma mark - Collection View Data Source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.CVs.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesCVCell forIndexPath:indexPath];
    
    cell.CV = self.CVs[indexPath.item];
    
    return cell;
}

#pragma mark - Collection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __FUNCTION__);
    LSLog(@"%ld",indexPath.item);
}

#pragma mark - Lazy Load

- (NSArray<LSmEntities *> *)CVs
{
    if (!_CVs) {
        //新建空的数组
        NSMutableArray<LSmEntities *> *CVArr = [NSMutableArray array];
        for (LSmEntities *entities in LSSingletonEntities) {
            if (entities.relation.cv) {
                [CVArr addObject:entities];
            }
        }
        _CVs = CVArr;
    }
    return _CVs;
}

@end
