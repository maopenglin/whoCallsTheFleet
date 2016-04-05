//
//  LScEntitiesDetailViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/20.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesDetailViewController.h"

#import "LSvEntitiesDetailView.h"
#import "LSvBarButtonItem.h"

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmName.h"
#import "LSmLink.h"

@interface LScEntitiesDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) LSvEntitiesDetailView *entitiesDetailView;

@end

@implementation LScEntitiesDetailViewController

#pragma mark - 工厂方法

+ (instancetype)entitiesDetailViewController
{
    return [[self alloc] init];
}

- (void)setupController
{
    [super setupController];
    
    self.controllerAttribute = LSSingletonControllerAttributes(LSkControllerTypeEntities);
    self.hidesBottomBarWhenPushed = YES;
    
    //创建左上角返回按钮
    LSvBarButtonItem *popItem = [LSvBarButtonItem barButtonItemForBack:self action:@selector(popItemDidClick)];
    //添加至导航条
    self.navigationItem.leftBarButtonItem = popItem;
    
    //创建右上角返回按钮
    LSvBarButtonItem *homeItem = [LSvBarButtonItem barButtonItemForHome:self action:@selector(homeItenDidClick)];
    //添加至导航条
    self.navigationItem.rightBarButtonItem = homeItem;
    
    //创建主体View
    LSvEntitiesDetailView *entitiesDetailView = [LSvEntitiesDetailView entitiesDetailView];
    self.entitiesDetailView = entitiesDetailView;
    //设置代理
    self.entitiesDetailView.shipTableView.dataSource = self;
    self.entitiesDetailView.shipTableView.delegate   = self;
    //添加至当前view
    [self.view addSubview:self.entitiesDetailView];
}

#pragma mark - 重写布局方法

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat entitiesDetailViewX = 0;
    CGFloat entitiesDetailViewY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat entitiesDetailViewW = CGRectGetWidth(self.view.frame);
    CGFloat entitiesDetailViewH = CGRectGetHeight(self.view.frame) - entitiesDetailViewY;
    
    self.entitiesDetailView.frame = CGRectMake(entitiesDetailViewX, entitiesDetailViewY, entitiesDetailViewW, entitiesDetailViewH);
}

#pragma mark - 回调方法

- (void)popItemDidClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)homeItenDidClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entities.relation.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierEntitiesDetailCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LSIdentifierEntitiesDetailCell];
    }
    
    cell.textLabel.text      = self.entities.relation[indexPath.row].lastObject.description;
    cell.textLabel.textColor = LSSingletonControllerAttributes(LSkControllerTypeEntities).color;
    cell.backgroundColor     = LSColorRandom;
    cell.selectionStyle      = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSLog(@"%s", __FUNCTION__);
}

#pragma mark - 重写set方法

- (void)setEntities:(LSmEntities *)entities
{
    _entities = entities;
    
    //设置中文姓名板
    self.entitiesDetailView.zhNameLbl.text = entities.name.zhCn;
    //根据情况设置日文姓名板
    if (![entities.name.jaJp isEqualToString:entities.name.zhCn]) {
        self.entitiesDetailView.jaNameLbl.text = entities.name.jaJp;
    } else {
        self.entitiesDetailView.jaNameLbl.text = @"";
    }
    //设置头像
    self.entitiesDetailView.iconView.image = [UIImage imageWithData:entities.picture.avatar];
    //设置标题和数量描述
    switch (entities.type) {
        case LSkEntitiesTypeCV:
            self.title = @"声优";
            self.entitiesDetailView.typeLbl.text = [NSString stringWithFormat:@"配音:%zd",self.entities.relation.count];
            break;
        case LSkEntitiesTypeIllustrator:
            self.title = @"画师";
            self.entitiesDetailView.typeLbl.text = [NSString stringWithFormat:@"绘制:%zd",self.entities.relation.count];
            break;
            
        default:
            break;
    }
    //设置链接默认不可用
    self.entitiesDetailView.linkTwitterBtn.enabled   = NO;
    self.entitiesDetailView.linkWikipediaBtn.enabled = NO;
    self.entitiesDetailView.linkPixivBtn.enabled     = NO;
    self.entitiesDetailView.linkHomepageBtn.enabled  = NO;
    
    //根据链接情况启用对应按钮
    [entities.links enumerateObjectsUsingBlock:^(LSmLink * _Nonnull link, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (link.type) {
            case LSkLinkTypeTwitter:
                if (![link.URL isEqual:@""]) {
                    self.entitiesDetailView.linkTwitterBtn.enabled   = YES;
                }
                break;
            case LSkLinkTypeWikipedia:
                if (![link.URL isEqual:@""]) {
                    self.entitiesDetailView.linkWikipediaBtn.enabled = YES;
                }
                break;
            case LSkLinkTypePixiv:
                if (![link.URL isEqual:@""]) {
                    self.entitiesDetailView.linkPixivBtn.enabled     = YES;
                }
                break;
            case LSkLinkTypeHomepage:
                if (![link.URL isEqual:@""]) {
                    self.entitiesDetailView.linkHomepageBtn.enabled  = YES;
                }
                break;
                
            default:
                break;
        };
    }];
    
    //赋值点击链接的回调Block
    self.entitiesDetailView.LSbLinkBtnDidClick = ^(LSkLinkType linkType){
        [entities.links enumerateObjectsUsingBlock:^(LSmLink * _Nonnull link, NSUInteger idx, BOOL * _Nonnull stop) {
            if (link.type == linkType) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:link.URL]];
            };
        }];
    };
    //赋值姓名版的富文本(暂时不用
//    UIColor *color = LSSingletonControllerAttributes(LSkControllerTypeEntities).color;
//    NSDictionary *attDict = @{NSStrokeColorAttributeName: [color colorWithAlphaComponent:1],
//                              NSStrokeWidthAttributeName: @-3,
//                              NSForegroundColorAttributeName: [[UIColor whiteColor] colorWithAlphaComponent:0.7],
//                              NSFontAttributeName: LSFontWithSize(30)};
//    
//    self.entitiesDetailView.zhNameLbl.attributedText = [[NSAttributedString alloc] initWithString:entities.name.zhCn attributes:attDict];
}

@end //LScEntitiesDetailViewController
