//
//  LScEntitiesViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmEntitiesRelation.h"

#import "LSvEntitiesCollectionViewCell.h"
#import "LSvEntitiesTableViewCell.h"

#import "LSmName.h"

typedef NS_ENUM (NSUInteger, LSkEntitiesType){
    LSkEntitiesTypeCV          = 0,//声优
    LSkEntitiesTypeIllustrator = 1 //画师
};

@interface LScEntitiesViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UISegmentedControl *segmentedControl;

//模型数组
@property (nonatomic, strong) NSArray<LSmEntities *> *entities;

@end

@implementation LScEntitiesViewController

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置标题为segmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"声优", @"画师"]];
    self.segmentedControl = segmentedControl;
    self.navigationItem.titleView = self.segmentedControl;
    self.segmentedControl.frame = CGRectMake(0, 0, 180, 25);
    //设置字号
    NSDictionary *attDict = @{NSFontAttributeName: LSFontWithSize(16)};
    [self.segmentedControl setTitleTextAttributes:attDict forState:UIControlStateNormal];
    //绑定事件响应
    [self.segmentedControl addTarget:self action:@selector(segmentedControlValueChanged) forControlEvents:UIControlEventValueChanged];
    
    
    /*** 创建CV视图 ***/
    //创建布局
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.itemSize                = CGSizeMake(80, 100);
    collectionViewLayout.minimumInteritemSpacing = 15;
    collectionViewLayout.minimumLineSpacing      = 20;
    collectionViewLayout.sectionInset            = UIEdgeInsetsMake(70, 20, 0, 20);
    //创建collectionView
    UICollectionView *mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:collectionViewLayout];
    self.mainCollectionView = mainCollectionView;
    [self.view addSubview:self.mainCollectionView];
    //设置代理、属性
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.delegate   = self;
    self.mainCollectionView.backgroundColor = [UIColor clearColor];
    //注册Cell
    UINib *collectionViewNib=[UINib nibWithNibName:@"LSvEntitiesCollectionViewCell" bundle:nil];
    [self.mainCollectionView registerNib:collectionViewNib forCellWithReuseIdentifier:LSIdentifierEntitiesCVCell];
    
    
    /*** 创建画师视图 ***/
    //创建TableView
    UITableView *mainTableView = [[UITableView alloc] init];
    self.mainTableView = mainTableView;
    [self.view addSubview:self.mainTableView];
    //设置代理、属性
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate   = self;
    self.mainTableView.backgroundColor = [UIColor clearColor];
    //注册Cell
    UINib *tableViewNib = [UINib nibWithNibName:@"LSvEntitiesTableViewCell" bundle:nil];
    [self.mainTableView registerNib:tableViewNib forCellReuseIdentifier:LSIdentifierEntitiesIllustratorCell];
    
    //默认选中“声优”页
    self.segmentedControl.selectedSegmentIndex = LSkEntitiesTypeCV;
    self.mainCollectionView.hidden = NO;
    self.mainTableView.hidden      = YES;
    [self segmentedControlValueChanged];
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
}

#pragma mark - 回调方法

- (void)segmentedControlValueChanged
{
    //清空模型数组
    self.entities = nil;

    [self entities];
}

#pragma mark - Collection View Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.entities.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesCollectionViewCell *cell = [LSvEntitiesCollectionViewCell entitiesCollectionViewCell:collectionView forIndexPath:indexPath];
    
    //赋值
    cell.CV    = self.entities[indexPath.row];
    cell.color = self.controllerAttribute.color;
    
    return cell;
}

#pragma mark - Collection View Delegate
#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entities.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesTableViewCell *cell = [LSvEntitiesTableViewCell entitiesTableViewCell:tableView forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table View Delegate

#pragma mark - Lazy Load

- (NSArray<LSmEntities *> *)entities
{
    if (!_entities) {
        //获取数据
        NSArray<LSmEntities *> *tempArr = [LSmEntities entities];
        //新建空的数组
        NSMutableArray<LSmEntities *> *descArr = [NSMutableArray array];
        //筛选数据 符合要求的添加至新建的数组
        switch (self.segmentedControl.selectedSegmentIndex) {
            case LSkEntitiesTypeCV:{
                for (LSmEntities *entities in tempArr) {
                    if (entities.relation.cv) {
                        [descArr addObject:entities];
                    };
                }
            }
                ;
                break;
            case LSkEntitiesTypeIllustrator:{
                for (LSmEntities *entities in tempArr) {
                    if (entities.relation.illustrator) {
                        [descArr addObject:entities];
                    };
                }
            }
                ;
                break;
                
            default:
                break;
        }
        _entities = descArr;
    }
    return _entities;
}

@end
