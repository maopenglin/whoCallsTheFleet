//
//  LScArsenalAllViewController.m
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/4/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScArsenalAllViewController.h"

@interface LScArsenalAllViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation LScArsenalAllViewController

#pragma mark - 工厂方法

+ (instancetype)arsenalAllViewController
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    }
    
    cell.backgroundColor = LSColorRandom;
    
    return cell;
}

@end
