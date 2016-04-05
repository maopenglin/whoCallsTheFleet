//
//  LScArsenalViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScArsenalViewController.h"

#import "LSmControllerAttributes.h"

#import "LSvVerticalSegmentedControlCell.h"
#import "LScTestTableViewController.h"

#import <Masonry/Masonry.h>

@interface LScArsenalViewController () <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *weekdays;

@end

@implementation LScArsenalViewController

#pragma mark - 工厂方法

+ (instancetype)arsenalViewController
{
    return [[self alloc] init];
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
    
    //创建星期选择控件
    UITableView *verticalSegmentedControl = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    [self.scrollView addSubview:verticalSegmentedControl];
    //设置约束
    [verticalSegmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.leftMargin.mas_equalTo(self.view.mas_left).offset(30);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(210);
    }];
    
    //设置代理
    verticalSegmentedControl.dataSource = self;
    verticalSegmentedControl.delegate   = self;
    //设置属性
    verticalSegmentedControl.backgroundColor              = [UIColor clearColor];
    verticalSegmentedControl.showsVerticalScrollIndicator = NO;
    verticalSegmentedControl.separatorStyle               = UITableViewCellSelectionStyleNone;
    verticalSegmentedControl.bounces                      = NO;

    verticalSegmentedControl.layer.cornerRadius           = 7.0f;
    verticalSegmentedControl.layer.masksToBounds          = YES;
    verticalSegmentedControl.layer.borderWidth            = 1.0f;
    verticalSegmentedControl.layer.borderColor            = LSSingletonControllerAttributes(LSkControllerTypeArsenal).color.CGColor;
    
    //设置第一格为选中
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [verticalSegmentedControl selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    //测试代码
    LScTestTableViewController *testVc = [[LScTestTableViewController alloc] init];
    testVc.tableView.frame = CGRectMake(50, 50, 120, 250);
    [self.scrollView addSubview:testVc.tableView];
    
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置标题为segmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"今日改修", @"改修明细表"]];
    self.segmentedControl = segmentedControl;
    self.segmentedControl.frame = CGRectMake(0, 0, 180, 25);
    self.navigationItem.titleView = self.segmentedControl;
    //设置字号
    NSDictionary *attDict = @{NSFontAttributeName: LSFontWithSize(14)};
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
    
    //计算需要使用的尺寸数值
//    CGFloat viewX = 0;
//    CGFloat viewY = 0;
//    CGFloat viewW = self.view.frame.size.width * 2;
//    CGFloat viewH = self.view.frame.size.height;
    //布局scrollView
    self.scrollView.frame       = self.view.frame;
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

#pragma mark - Vertical Segmented Control Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weekdays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvVerticalSegmentedControlCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierArsenalWeekdayCell];
    if (!cell) {
        cell = [[LSvVerticalSegmentedControlCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LSIdentifierArsenalWeekdayCell];
    }

    cell.lable.text = ((NSNumber *)self.weekdays[indexPath.row]).description;
    cell.color = LSSingletonControllerAttributes(LSkControllerTypeArsenal).color;
    
    if (indexPath.row == 0) {
        cell.lable.textColor = LSColorWithRGBA(30, 30, 30, 1);
    }

    return cell;
}

#pragma mark - Vertical Segmented Control Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvVerticalSegmentedControlCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.lable.textColor = LSColorWithRGBA(30, 30, 30, 1);
    
    LSLog(@"%zd",indexPath.row);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    LSvVerticalSegmentedControlCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.lable.textColor = LSSingletonControllerAttributes(LSkControllerTypeArsenal).color;
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isEqual:self.scrollView]) return;
    self.segmentedControl.selectedSegmentIndex = (NSInteger)((scrollView.contentOffset.x / self.view.frame.size.width) + 0.5);
}

#pragma mark - 重写get方法

- (NSArray *)weekdays
{
    return @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
}

@end
