//
//  LScIllustratorViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/19.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScIllustratorViewController.h"
#import "LScBaseNavigationController.h"
#import "LScShowEntitiesViewController.h"

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
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LScShowEntitiesViewController" bundle:nil];
//    LScShowEntitiesViewController *showEntitiesVc = sb.instantiateInitialViewController;
//    LScBaseNavigationController *navVc = [LScBaseNavigationController alloc] initWithType:LSkControllerTypeEntities AndBackgroundImage:<#(UIImage *)#>;
//    showEntitiesVc.controllerAttribute = LSSingletonControllerAttributes(LSkControllerTypeEntities);
    NSLog(@"%s", __FUNCTION__);
    LSLog(@"%ld",indexPath.row);
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
        //新建空的数组
        NSMutableArray<LSmEntities *> *illustratorArr = [NSMutableArray array];
        for (LSmEntities *entities in LSSingletonEntities) {
            if (entities.relation.illustrator) {
                [illustratorArr addObject:entities];
            }
        }
        _illustrators = illustratorArr;
    }
    return _illustrators;
}

@end
