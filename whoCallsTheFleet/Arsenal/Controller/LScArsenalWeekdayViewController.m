//
//  LScArsenalWeekdayViewController.m
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/4/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScArsenalWeekdayViewController.h"

#import "LSvArsenalWeekdayTableViewCell.h"

@interface LScArsenalWeekdayViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation LScArsenalWeekdayViewController

#pragma mark - 工厂方法

+ (instancetype)arsenalWeekdayViewController
{
    return [[self alloc] init];
}
- (instancetype)init
{
    if (self = [super init]) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        self.tableView = tableView;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        //注册cell
        [self.tableView registerNib:[UINib nibWithNibName:@"LSvArsenalWeekdayTableViewCell" bundle:nil] forCellReuseIdentifier:LSIdentifierArsenalCell];
    }
    return self;
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSvArsenalWeekdayTableViewCell *cell = [LSvArsenalWeekdayTableViewCell arsenalWeekdayTableViewCell:tableView forRowAtIndexPath:indexPath];
    
    cell.backgroundColor = LSColorRandom;
    
    return cell;
}

@end
