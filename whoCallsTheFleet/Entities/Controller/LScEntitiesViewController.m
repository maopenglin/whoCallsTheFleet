//
//  LScEntitiesViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesViewController.h"

#import "LScEntitiesDetailViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"
#import "LSmName.h"

#import "LSvCVsView.h"
#import "LSvIllustratorsView.h"

@interface LScEntitiesViewController ()

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, weak) UIScrollView *scrollView;
//模型数据
@property (nonatomic, strong) NSArray<LSmEntities *> *CVs;
@property (nonatomic, strong) NSArray<LSmEntities *> *illustrators;

@end //LScEntitiesViewController

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
    self.scrollView.backgroundColor                = [UIColor clearColor];
    self.scrollView.contentSize                    = CGSizeMake(scrollViewW, 0);
    self.scrollView.bounces                        = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled                  = YES;

    //创建每页分别显示的View
    UICollectionViewFlowLayout *CVsViewLayout = [[UICollectionViewFlowLayout alloc] init];
    LSvCVsView *CVsView = [LSvCVsView CVsViewWithFrame:CGRectMake(scrollViewX, scrollViewY, scrollViewW * 0.5, scrollViewH) collectionViewLayout:CVsViewLayout];
    LSvIllustratorsView *illustratorsView = [LSvIllustratorsView illustratorsViewWithFrame:CGRectMake(scrollViewW * 0.5, 0, scrollViewW * 0.5, scrollViewH) style:UITableViewStylePlain];
    //设置数据
    CVsView.CVs                   = self.CVs;
    illustratorsView.illustrators = self.illustrators;
    //设置背景色
    CVsView.backgroundColor          = LSColorRandom;
    illustratorsView.backgroundColor = LSColorRandom;
    //添加至scrollView
    [self.scrollView addSubview:CVsView];
    [self.scrollView addSubview:illustratorsView];

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

    [self.navigationController.view bringSubviewToFront:self.navigationController.navigationBar];
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
