//
//  LScEntitiesViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesViewController.h"

#import "LScCVViewController.h"
#import "LScIllustratorViewController.h"
#import "LScEntitiesDetailViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"
#import "LSmName.h"

@interface LScEntitiesViewController ()<UICollectionViewDelegate, UITableViewDelegate>

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, weak) UIScrollView *scrollView;
//模型数据
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) NSArray<NSArray<LSmEntities *> *> *entities;

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
    
    //创建用于分页的scrollView
    CGFloat scrollViewX = 0;
    CGFloat scrollViewY = 0;
    CGFloat scrollViewW = self.navigationController.view.frame.size.width * 2;
    CGFloat scrollViewH = self.navigationController.view.frame.size.height;

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.navigationController.view.frame];
    self.scrollView = scrollView;
    [self.navigationController.view addSubview:self.scrollView];
    //设置属性
    self.scrollView.backgroundColor = LSColorRandom;
    self.scrollView.contentSize     = CGSizeMake(scrollViewW, 0);
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    //设置临时背景（测试用
    UIImageView *tempImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tbg0"]];
    tempImgView.frame = CGRectMake(scrollViewX, scrollViewY, scrollViewW, scrollViewH);
    [self.scrollView addSubview:tempImgView];

    
//    //创建布局
//    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
//    //设置属性
//    collectionViewLayout.itemSize                = self.view.frame.size;
//    collectionViewLayout.minimumInteritemSpacing = 0;
//    collectionViewLayout.minimumLineSpacing      = 0;
//    collectionViewLayout.scrollDirection         = UICollectionViewScrollDirectionHorizontal;
//    //创建用于分页的collectionView
//    UICollectionView *mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:collectionViewLayout];
//    self.mainCollectionView = mainCollectionView;
//    [self.navigationController.view addSubview:self.mainCollectionView];
//    //基本属性
//    self.mainCollectionView.showsHorizontalScrollIndicator = NO;
//    self.mainCollectionView.bounces                        = NO;
//    self.mainCollectionView.pagingEnabled                  = YES;
//    self.mainCollectionView.backgroundColor                = [UIColor clearColor];
//    self.mainCollectionView.allowsSelection                = NO;
//    //代理
//    self.mainCollectionView.dataSource = self;
//    self.mainCollectionView.delegate   = self;
//    //注册Cell
//    [self.mainCollectionView registerClass:[LSvEntitiesCollectionViewCell class] forCellWithReuseIdentifier:LSIdentifierEntitiesMainCell];
    //绑定手势
    [self.scrollView addGestureRecognizer:self.screenEdgePanGestureRecognizer];

    //默认选中“声优”页
    self.segmentedControl.selectedSegmentIndex = 0;
    [self segmentedControlValueChanged:self.segmentedControl];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    LSLog(@"entities------%s", __FUNCTION__);

//    //创建分页collectionView
//    LSvEntitiesCollectionView *mainCollectionView = [LSvEntitiesCollectionView entitiesCollectionViewWithCellSize:self.view.frame.size];
//    self.mainCollectionView = mainCollectionView;
//    [self.navigationController.view addSubview:self.mainCollectionView];
//    //刷新显示
//    [self.mainCollectionView reloadData];
//    //代理
//    self.mainCollectionView.dataSource = self;
//    self.mainCollectionView.delegate   = self;
//    //注册Cell
//    [self.mainCollectionView registerClass:[LSvEntitiesCollectionViewCell class] forCellWithReuseIdentifier:LSIdentifierEntitiesMainCell];
//    //绑定手势
//    [self.mainCollectionView addGestureRecognizer:self.screenEdgePanGestureRecognizer];
//    
//    //    默认选中“声优”页
//    self.segmentedControl.selectedSegmentIndex = 0;
//    [self segmentedControlValueChanged:self.segmentedControl];
//}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    //移除手势
//    [self.mainCollectionView removeGestureRecognizer:self.screenEdgePanGestureRecognizer];
//    //清除属性
//    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj = nil;
//    }];
//    self.viewControllers = nil;
//    //从父容器移除
//    [self.mainCollectionView removeFromSuperview];
//    //释放
//    self.mainCollectionView = nil;
//}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    LSLog(@"entities------%s", __FUNCTION__);
//}

#pragma mark - 重写布局方法

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
//    self.mainCollectionView.frame = self.view.frame;
    

    [self.navigationController.view bringSubviewToFront:self.navigationController.navigationBar];
    [self.navigationController.view bringSubviewToFront:self.menuView];
}

#pragma mark - 回调方法

- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl
{
    //若菜单栏展开 收回菜单栏
    if (self.menuView.isOpen) {
        [self menuBtnItemDidClick];
    }
    //滚动页面
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:segmentedControl.selectedSegmentIndex inSection:0];
//    [self.mainCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}

#pragma mark - Collection View Data Source

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return 2;
//}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    LSvEntitiesCollectionViewCell *cell = [LSvEntitiesCollectionViewCell entitiesCollectionViewCell:collectionView indexPath:indexPath];
//    
//    cell.entitiesVc      = self.viewControllers[indexPath.item];
//    cell.backgroundColor = [UIColor clearColor];
//    
////    cell.backgroundColor = LSColorRandom;
//    
//    //建立控制器之间的联系
//    if (![self.navigationController.childViewControllers containsObject:cell.entitiesVc]) {
//        [self.navigationController addChildViewController:cell.entitiesVc];
//    }
//
//    return cell;
//}

#pragma mark - Collection View Delegate

//- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([cell.reuseIdentifier isEqualToString:LSIdentifierEntitiesMainCell]) {
//        self.segmentedControl.selectedSegmentIndex = !(indexPath.item);
//    }
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LScEntitiesDetailViewController *vc = [[LScEntitiesDetailViewController alloc] init];
    vc.view.backgroundColor = LSColorRandom;
    vc.title = self.entities[0][indexPath.item].name.zhCn;

    [self.navigationController pushViewController:vc animated:YES];
//    LSLog(@"%@", [collectionView class]);
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LScEntitiesDetailViewController *vc = [[LScEntitiesDetailViewController alloc] init];
    
    vc.view.backgroundColor = LSColorRandom;
    vc.title = self.entities[1][indexPath.row].name.zhCn;
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Lazy Load

- (NSArray<UIViewController *> *)viewControllers
{
    if (!_viewControllers) {
        
        //创建控制器
        LScCVViewController *CVViewController = [LScCVViewController CVViewController];
        LScIllustratorViewController *illustratorViewController = [LScIllustratorViewController illustratorViewController];
        //更换代理
        CVViewController.collectionView.delegate     = self;
        illustratorViewController.tableView.delegate = self;
        //设置数据
        CVViewController.CVs                   = self.entities[0];
        illustratorViewController.illustrators = self.entities[1];

        //存放于数组
        _viewControllers = @[CVViewController, illustratorViewController];
    }
    return _viewControllers;
}

- (NSArray<NSArray<LSmEntities *> *> *)entities
{
    if (!_entities) {
        //新建空的数组
        NSMutableArray<LSmEntities *> *CVArr = [NSMutableArray array];
        NSMutableArray<LSmEntities *> *illustratorArr = [NSMutableArray array];
        for (LSmEntities *entities in LSSingletonEntities) {
            if (entities.relation.cv) {
                [CVArr addObject:entities];
            } else if (entities.relation.illustrator) {
                [illustratorArr addObject:entities];
            }
        }
        _entities = @[CVArr, illustratorArr];
    }
    return _entities;
}

@end
