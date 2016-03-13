//
//  LScOptionViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScOptionViewController.h"

#import "LSvOptionTableView.h"
#import "LSvOptionTableViewCell.h"
#import "LSvOptionHeaderView.h"

#import "LSmOption.h"
#import "LSmOptionItem.h"

@interface LScOptionViewController ()<UITableViewDataSource, UITableViewDelegate>

//optionTableView数据模型
@property (nonatomic, strong) NSMutableArray<LSmOption *> *options;

@end

@implementation LScOptionViewController

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建TableView
    LSvOptionTableView *tableView = [LSvOptionTableView optionTableView];
    self.mainTableView = tableView;
    [self.view addSubview:self.mainTableView];
    //设置代理
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate   = self;
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
    cell.color                    = self.controllerAttribute.color;
    cell.LSbAccessoryValueChanged = ^(NSString *value){
        //收回键盘
        [self.mainTableView endEditing:YES];
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
    [self.mainTableView endEditing:YES];
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
