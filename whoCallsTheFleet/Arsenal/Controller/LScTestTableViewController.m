//
//  LScTestTableViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/4/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScTestTableViewController.h"

@interface LScTestTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation LScTestTableViewController

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
- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    
    return cell;
}

@end
