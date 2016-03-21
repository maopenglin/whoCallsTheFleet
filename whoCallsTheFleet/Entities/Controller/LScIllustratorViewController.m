//
//  LScIllustratorViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScIllustratorViewController.h"

#import "LSvIllustratorCell.h"

@implementation LScIllustratorViewController

+ (instancetype)illustratorViewController
{
    UIStoryboard *illustratorSb = [UIStoryboard storyboardWithName:@"LScIllustratorViewController" bundle:nil];
    LScIllustratorViewController *tableVc = illustratorSb.instantiateInitialViewController;
    
    tableVc.tableView.contentInset = UIEdgeInsetsMake(50, 0, 50, 0);
    
    return tableVc;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.illustrators.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSvIllustratorCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierEntitiesIllustratorCell forIndexPath:indexPath];
    
    cell.illustrator = self.illustrators[indexPath.row];
    
    return cell;
}

//#pragma mark - Table View Delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    LScEntitiesDetailViewController *vc = [[LScEntitiesDetailViewController alloc] init];
//    
//    vc.view.backgroundColor = LSColorRandom;
//    vc.title = self.illustrators[indexPath.row].name.zhCn;
//    
//    [self.navigationController pushViewController:vc animated:YES];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
