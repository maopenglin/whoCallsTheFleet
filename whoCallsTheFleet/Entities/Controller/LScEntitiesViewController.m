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
#import "LSmName.h"

#import "LSvCVsViewCell.h"
#import "LSvIllustratorsViewCell.h"

@interface LScEntitiesViewController () <UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UICollectionView *CVsView;
@property (nonatomic, weak) UITableView *illustratorsView;
//模型数据
@property (nonatomic, strong) NSArray<NSArray<LSmEntities *> *> *entities;

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
    
    //创建用于分页的scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:self.scrollView];
    //设置代理
    self.scrollView.delegate                       = self;
    //设置属性
    self.scrollView.backgroundColor                = LSColorClear;
    self.scrollView.contentSize                    = CGSizeMake(self.view.frame.size.width * 2, 0);
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
    UICollectionView *CVsView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:CVsViewLayout];
    self.CVsView = CVsView;
    //设置代理
    self.CVsView.dataSource = self;
    self.CVsView.delegate   = self;
    //设置属性
    self.CVsView.showsVerticalScrollIndicator = NO;
    //注册cell
    [self.CVsView registerNib:[UINib nibWithNibName:@"LSvCVsViewCell" bundle:nil] forCellWithReuseIdentifier:LSIdentifierEntitiesCVCell];
    //设置背景色
    CVsView.backgroundColor = LSColorClear;
    //添加至scrollView
    [self.scrollView addSubview:self.CVsView];
    
    //创建画师页面View
    UITableView *illustratorsView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    self.illustratorsView = illustratorsView;
    //设置代理
    self.illustratorsView.dataSource = self;
    self.illustratorsView.delegate   = self;
    //设置属性
    self.illustratorsView.separatorStyle               = UITableViewCellSeparatorStyleNone;
    self.illustratorsView.contentOffset                = CGPointMake(0, -50);
    self.illustratorsView.contentInset                 = UIEdgeInsetsMake(50, 0, 55, 0);
    self.illustratorsView.showsVerticalScrollIndicator = NO;
    //注册cell
    [self.illustratorsView registerNib:[UINib nibWithNibName:@"LSvIllustratorsViewCell" bundle:nil] forCellReuseIdentifier:LSIdentifierEntitiesIllustratorCell];
    //设置背景色
    illustratorsView.backgroundColor = LSColorClear;
    //添加至scrollView
    [self.scrollView addSubview:self.illustratorsView];
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
    self.segmentedControl.selectedSegmentIndex = LSkEntitiesTypeCV;
    [self segmentedControlValueChanged:self.segmentedControl];
}

#pragma mark - 重写布局方法

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //计算需要使用的尺寸数值
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = self.view.frame.size.width * 2;
    CGFloat viewH = self.view.frame.size.height;
    //布局scrollView
    self.scrollView.frame       = self.view.frame;
    //布局CVsView
    self.CVsView.frame          = CGRectMake(viewX, viewY, viewW * 0.5, viewH);
    //布局illustratorsView
    self.illustratorsView.frame = CGRectMake(viewW * 0.5, 0, viewW * 0.5, viewH);

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
- (void)pushEntitiesDetailViewController:(NSInteger)index withType:(LSkEntitiesType)entitiesType
{
    //创建控制器
    LScEntitiesDetailViewController *entitiesDetailVc = [LScEntitiesDetailViewController entitiesDetailViewController];
    //传值
    entitiesDetailVc.entities = self.entities[entitiesType][index];
    //控制器压栈
    [self.navigationController pushViewController:entitiesDetailVc animated:YES];
}

#pragma mark - Collection View DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.entities[LSkEntitiesTypeCV].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvCVsViewCell *cell = [LSvCVsViewCell CVsViewCell:collectionView forItemAtIndexPath:indexPath];
    
    //设置数据
    cell.CV = self.entities[LSkEntitiesTypeCV][indexPath.item];
    
    return cell;
}

#pragma mark - Collection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushEntitiesDetailViewController:indexPath.item withType:LSkEntitiesTypeCV];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entities[LSkEntitiesTypeIllustrator].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvIllustratorsViewCell *cell = [LSvIllustratorsViewCell illustratorViewCell:tableView forRowAtIndexPath:indexPath];
    
    //设置数据
    cell.illustrator = self.entities[LSkEntitiesTypeIllustrator][indexPath.row];
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushEntitiesDetailViewController:indexPath.row withType:LSkEntitiesTypeIllustrator];
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.illustratorsView]) return;
    self.segmentedControl.selectedSegmentIndex = (NSInteger)((scrollView.contentOffset.x / self.view.frame.size.width) + 0.5);
}

#pragma mark - Lazy Load

- (NSArray<NSArray<LSmEntities *> *> *)entities
{
    if (!_entities) {
        //新建空的数组
        NSMutableArray<LSmEntities *> *CVArr = [NSMutableArray array];
        NSMutableArray<LSmEntities *> *illustratorArr = [NSMutableArray array];
        for (LSmEntities *entities in LSSingletonEntities) {
            switch (entities.type) {
                case LSkEntitiesTypeCV:
                    [CVArr addObject:entities];
                    break;
                case LSkEntitiesTypeIllustrator:
                    [illustratorArr addObject:entities];
                    break;
                    
                default:
                    break;
            }
        }
        _entities = @[CVArr, illustratorArr];
    }
    return _entities;
}

@end //LScEntitiesViewController
