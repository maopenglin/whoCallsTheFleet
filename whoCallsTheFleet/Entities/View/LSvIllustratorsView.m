//
//  LSvIllustratorsView.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/22.
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
        //设置代理
        self.dataSource = self;
        self.delegate   = self;
        //注册cell
        [self registerNib:[UINib nibWithNibName:@"LSvIllustratorsViewCell" bundle:nil] forCellReuseIdentifier:LSIdentifierEntitiesIllustratorCell];
        //设置属性
        self.separatorStyle               = UITableViewCellSeparatorStyleNone;
        self.contentInset                 = UIEdgeInsetsMake(50, 0, 55, 0);
        self.showsVerticalScrollIndicator = NO;
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
    
    //设置数据
    cell.illustrator = self.illustrators[indexPath.row];
    
    return cell;
}

@end //LSvIllustratorsView
