//
//  LScCVViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScCVViewController.h"

#import "LSvCVCell.h"

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

//#pragma mark - Collection View Delegate
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
////    LScEntitiesDetailViewController *vc = [[LScEntitiesDetailViewController alloc] init];
////    vc.view.backgroundColor = LSColorRandom;
////    vc.title = self.CVs[indexPath.item].name.zhCn;
////    
////    
////    [self.navigationController pushViewController:vc animated:YES];
//}

@end
