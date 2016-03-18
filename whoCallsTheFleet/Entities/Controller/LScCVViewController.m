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

@interface LScCVViewController ()

@property (nonatomic, strong) NSArray<LSmEntities *> *CVs;

@end

@implementation LScCVViewController

+ (instancetype)CVViewController
{
    UIStoryboard *CVSb = [UIStoryboard storyboardWithName:@"LScCVViewController" bundle:nil];
    
    return CVSb.instantiateInitialViewController;
}

#pragma mark - Controller生命周期方法

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Collection View Data Source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.CVs.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesCVCell forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Lazy Load

- (NSArray<LSmEntities *> *)CVs
{
    if (!_CVs) {
        //获取数据
        NSArray<LSmEntities *> *tempArr = [LSmEntities entities];
        //新建空的数组
        NSMutableArray<LSmEntities *> *CVArr = [NSMutableArray array];
        for (LSmEntities *entities in tempArr) {
            if (entities.relation.cv) {
                [CVArr addObject:entities];
            }
        }
        _CVs = CVArr;
    }
    return _CVs;
}

@end
