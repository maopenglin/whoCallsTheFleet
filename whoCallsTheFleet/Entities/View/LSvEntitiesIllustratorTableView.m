//
//  LSvEntitiesIllustratorTableView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesIllustratorTableView.h"
#import "LSvEntitiesIllustratorCell.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"

@interface LSvEntitiesIllustratorTableView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation LSvEntitiesIllustratorTableView

+ (instancetype)entitienIllustratorTableView
{
    //创建TableView
    LSvEntitiesIllustratorTableView *tableView = [[LSvEntitiesIllustratorTableView alloc] init];
    //设置代理
    tableView.dataSource = tableView;
    tableView.delegate   = tableView;
    //设置属性
    tableView.backgroundColor = [UIColor clearColor];
    tableView.allowsSelection = NO;
    tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    tableView.contentInset    = UIEdgeInsetsMake(LSConstTopPadding, 0, LSConstBottomPadding, 0);
    tableView.contentOffset   = CGPointMake(0, - LSConstTopPadding);
    //注册Cell
    UINib *tableViewNib = [UINib nibWithNibName:@"LSvEntitiesIllustratorCell" bundle:nil];
    [tableView registerNib:tableViewNib forCellReuseIdentifier:LSIdentifierEntitiesIllustratorCell];
    
    return tableView;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entitiesIllustrator.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesIllustratorCell *cell = [LSvEntitiesIllustratorCell entitiesIllustratorCell:tableView forIndexPath:indexPath];
    
    cell.illustrator = self.entitiesIllustrator[indexPath.row];
    cell.color       = LSColorRandom;
    
    return cell;
}
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end
