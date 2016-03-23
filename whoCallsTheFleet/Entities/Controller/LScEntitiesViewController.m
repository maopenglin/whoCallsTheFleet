//
//  LScEntitiesViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesViewController.h"

#import "LScEntitiesDetailViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"
#import "LSmName.h"

#import "LSvCVsView.h"
#import "LSvIllustratorsView.h"

@interface LScEntitiesViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, weak) UIScrollView *scrollView;
//模型数据
@property (nonatomic, strong) NSArray<LSmEntities *> *CVs;
@property (nonatomic, strong) NSArray<LSmEntities *> *illustrators;

@end //LScEntitiesViewController

@implementation LScEntitiesViewController

#pragma mark - 工厂方法

+ (instancetype)entitiesViewController
{
    return [[self alloc] init];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}
- (void)setupController
{
    [super setupController];
    
    //计算需要使用的尺寸数值
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = self.view.frame.size.width * 2;
    CGFloat viewH = self.view.frame.size.height;
    
    //创建用于分页的scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView = scrollView;
    [self.view addSubview:self.scrollView];
    //设置代理
    self.scrollView.delegate                       = self;
    //设置属性
    self.scrollView.backgroundColor                = [UIColor clearColor];
    self.scrollView.contentSize                    = CGSizeMake(viewW, 0);
    self.scrollView.bounces                        = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled                  = YES;
    
    //创建每页分别显示的View
    //创建声优页面布局
    UICollectionViewFlowLayout *CVsViewLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置布局属性
    CVsViewLayout.minimumLineSpacing      = 20;
    CVsViewLayout.minimumInteritemSpacing = 15;
    CVsViewLayout.itemSize                = CGSizeMake(80, 100);
    CVsViewLayout.sectionInset            = UIEdgeInsetsMake(60, 20, 55, 20);
    //创建声优页面View
    LSvCVsView *CVsView = [LSvCVsView CVsViewWithFrame:CGRectMake(viewX, viewY, viewW * 0.5, viewH) collectionViewLayout:CVsViewLayout];
    //创建画师页面View
    LSvIllustratorsView *illustratorsView = [LSvIllustratorsView illustratorsViewWithFrame:CGRectMake(viewW * 0.5, 0, viewW * 0.5, viewH) style:UITableViewStylePlain];
    //设置数据
    CVsView.CVs                   = self.CVs;
    illustratorsView.illustrators = self.illustrators;
    //设置回调Block
    CVsView.LSbCellDidSelect = ^(NSIndexPath *indexPath){
        //获取数据
        LSmEntities *CV = self.CVs[indexPath.item];
        //push控制器
        [self pushEntitiesDetailViewController:CV];
    };
    illustratorsView.LSbCellDidSelect = ^(NSIndexPath *indexPath){
        //获取数据
        LSmEntities *illustrator = self.illustrators[indexPath.row];
        //push控制器
        [self pushEntitiesDetailViewController:illustrator];
    };
    
    //设置背景色
    CVsView.backgroundColor          = [UIColor clearColor];
    illustratorsView.backgroundColor = [UIColor clearColor];
    //添加至scrollView
    [self.scrollView addSubview:CVsView];
    [self.scrollView addSubview:illustratorsView];
}

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

    //绑定手势
    [self.scrollView addGestureRecognizer:self.screenEdgePanGestureRecognizer];

    //默认选中“声优”页
    self.segmentedControl.selectedSegmentIndex = 0;
    [self segmentedControlValueChanged:self.segmentedControl];
}

#pragma mark - 重写布局方法

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    [self.view bringSubviewToFront:self.menuView];
}

#pragma mark - 回调方法

/**
 *  顶部分段栏值改变
 */
- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl
{
    //若菜单栏展开 收回菜单栏
    if (self.menuView.isOpen) {
        [self menuBtnItemDidClick];
    }
    //滚动页面
    NSInteger index = segmentedControl.selectedSegmentIndex;
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * index, 0);
    }];
}

/**
 *  push画师&声优详细页面的控制器
 */
- (void)pushEntitiesDetailViewController:(LSmEntities *)entities
{
    //创建控制器
    LScEntitiesDetailViewController *entitiesDetailVc = [LScEntitiesDetailViewController entitiesDetailViewController];
    //传值
    entitiesDetailVc.entities = entities;
    //控制器压栈
    [self.navigationController pushViewController:entitiesDetailVc animated:YES];
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.segmentedControl.selectedSegmentIndex = (NSInteger)((scrollView.contentOffset.x / self.view.frame.size.width) + 0.5);
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

- (NSArray<LSmEntities *> *)illustrators
{
    if (!_illustrators) {
        //新建空的数组
        NSMutableArray<LSmEntities *> *illustratorArr = [NSMutableArray array];
        for (LSmEntities *entities in LSSingletonEntities) {
            if (entities.relation.illustrator) {
                [illustratorArr addObject:entities];
            }
        }
        _illustrators = illustratorArr;
    }
    return _illustrators;
}

@end //LScEntitiesViewController
