//
//  LSvIllustratorsView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/22.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvIllustratorsView.h"

#import "LSvIllustratorsViewCell.h"

@interface LSvIllustratorsView () <UITableViewDataSource, UITableViewDelegate>

@end //LSvIllustratorsView

@implementation LSvIllustratorsView

#pragma mark - 工厂方法

+ (instancetype)illustratorsViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    return [[LSvIllustratorsView alloc] initWithFrame:frame style:style];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate   = self;
        [self registerClass:[LSvIllustratorsViewCell class] forCellReuseIdentifier:LSIdentifierEntitiesIllustratorCell];
    }
    return self;
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.illustrators.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSvIllustratorsViewCell *cell = [LSvIllustratorsViewCell illustratorViewCell:tableView forRowAtIndexPath:indexPath];
    
    cell.illustrator = self.illustrators[indexPath.row];
    
    return cell;
}

@end //LSvIllustratorsView
