//
//  LScOptionViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScOptionViewController.h"

#import "LSvOptionTableView.h"
#import "LSvOptionTableViewCell.h"
#import "LSvOptionHeaderView.h"

#import "LSmOption.h"
#import "LSmOptionItem.h"

@interface LScOptionViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
//optionTableView数据模型
@property (nonatomic, strong) NSMutableArray<LSmOption *> *options;

@end

@implementation LScOptionViewController

#pragma mark - 工厂方法

+ (instancetype)optionViewController
{
    return [[self alloc] init];
}
- (instancetype)init
{
    if (self = [super init]) {
        //创建TableView
        LSvOptionTableView *tableView = [LSvOptionTableView optionTableView];
        self.tableView = tableView;
        //设置代理
        self.tableView.dataSource = self;
        self.tableView.delegate   = self;
        //添加至当前view
        [self.view addSubview:self.tableView];
    }
    return self;
}

#pragma mark - controller布局方法

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat tableViewX = 0;
    CGFloat tableViewY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat tableViewW = CGRectGetWidth(self.view.frame);
    CGFloat tableViewH = CGRectGetHeight(self.view.frame) - tableViewY;
    
    self.tableView.frame = CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH);
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.options.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.options[section].items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvOptionTableViewCell *cell = [LSvOptionTableViewCell optionTableViewCell:tableView];

    //赋值
    cell.optionItem               = self.options[indexPath.section].items[indexPath.row];
    cell.LSbAccessoryValueChanged = ^(NSString *value){
        //收回键盘
        [self.tableView endEditing:YES];
        //更新数据
        self.options[indexPath.section].items[indexPath.row].value = value;
        //保存数据
        [[LSmOption toDicts:self.options] writeToFile:LSPathUserOptionPlist atomically:YES];
    };
    return cell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LSvOptionHeaderView *headerView = [LSvOptionHeaderView optionHeaderView];
    
    headerView.color = self.controllerAttribute.color;
    headerView.title = self.options[section].title;
    
    return headerView;
}

#pragma mark - 重写scrollView的方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.tableView endEditing:YES];
}

#pragma mark - Lazy Load

- (NSMutableArray<LSmOption *> *)options
{
    if (!_options) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:LSPathUserOptionPlist]) {
            _options = [LSmOption options:LSPathUserOptionPlist];
        } else {
            _options = [LSmOption options:[[NSBundle mainBundle] pathForResource:@"LSmOption" ofType:@"plist"]];
        }
    }
    return _options;
}

@end
