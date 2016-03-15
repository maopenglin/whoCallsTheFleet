//
//  LScEntitiesViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"

#import "LSvEntitiesCollectionView.h"
#import "LSvEntitiesCollectionViewCell.h"

@interface LScEntitiesViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, weak) UICollectionView *mainCollectionView;

@end

@implementation LScEntitiesViewController

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置标题为segmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"声优", @"画师"]];
    self.segmentedControl = segmentedControl;
    self.segmentedControl.frame = CGRectMake(0, 0, 180, 25);
    self.navigationItem.titleView = self.segmentedControl;
    //设置字号
    NSDictionary *attDict = @{NSFontAttributeName: LSFontWithSize(16)};
    [self.segmentedControl setTitleTextAttributes:attDict forState:UIControlStateNormal];
    //绑定事件响应
    [self.segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    //创建分页collectionView
    LSvEntitiesCollectionView *mainCollectionView = [LSvEntitiesCollectionView entitiesCollectionViewWithCellSize:self.view.bounds.size];
    self.mainCollectionView = mainCollectionView;
    [self.view addSubview:self.mainCollectionView];
    //代理
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.delegate   = self;
    //注册Cell
    [self.mainCollectionView registerClass:[LSvEntitiesCollectionViewCell class] forCellWithReuseIdentifier:LSIdentifierEntitiesMainCell];

    //默认选中“声优”页
    self.segmentedControl.selectedSegmentIndex = LSkEntitiesTypeCV;
    [self segmentedControlValueChanged:self.segmentedControl];
}

#pragma mark - 重写布局方法

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //单次执行以下代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self layoutOtherMenuView];
    });
    
    CGFloat mainCollectionViewX = 0;
    CGFloat mainCollectionViewY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat mainCollectionViewW = CGRectGetWidth(self.view.frame);
    CGFloat mainCollectionViewH = CGRectGetHeight(self.view.frame) - mainCollectionViewX;
    
    self.mainCollectionView.frame = CGRectMake(mainCollectionViewX, mainCollectionViewY, mainCollectionViewW, mainCollectionViewH);
}

#pragma mark - 回调方法

- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl
{
    //若菜单栏展开 收回菜单栏
    if (self.otherMenuView.isOpen) {
        [self otherMenuBtnItemDidClick];
    }
    //滚动页面
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:segmentedControl.selectedSegmentIndex inSection:0];
    [self.mainCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}

#pragma mark - Collection View Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesCollectionViewCell *cell = [LSvEntitiesCollectionViewCell entitiesCollectionViewCell:collectionView forItemAtIndexPath:indexPath];
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LSIdentifierEntitiesMainCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.segmentedControl.selectedSegmentIndex = (scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width) / 0.5;
}

@end
