//
//  LScIllustratorViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScIllustratorViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesRelation.h"

#import "LSvIllustratorCell.h"

@interface LScIllustratorViewController ()

@property (nonatomic, strong) NSArray<LSmEntities *> *illustrators;

@end

@implementation LScIllustratorViewController

+ (instancetype)illustratorViewController
{
    UIStoryboard *illustratorSb = [UIStoryboard storyboardWithName:@"LScIllustratorViewController" bundle:nil];
    
    return illustratorSb.instantiateInitialViewController;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.illustrators.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSvIllustratorCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierEntitiesIllustratorCell forIndexPath:indexPath];
    
    cell.illustrator = self.illustrators[indexPath.row];
    cell.color       = self.color;
    cell.tintColor   = self.color;
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __FUNCTION__);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Lazy Load

- (NSArray<LSmEntities *> *)illustrators
{
    if (!_illustrators) {
        //获取数据
        NSArray<LSmEntities *> *tempArr = [LSmEntities entities];
        //新建空的数组
        NSMutableArray<LSmEntities *> *illustratorArr = [NSMutableArray array];
        for (LSmEntities *entities in tempArr) {
            if (entities.relation.illustrator) {
                [illustratorArr addObject:entities];
            }
        }
        _illustrators = illustratorArr;
    }
    return _illustrators;
}

@end
