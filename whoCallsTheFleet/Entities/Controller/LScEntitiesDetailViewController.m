//
//  LScEntitiesDetailViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/20.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesDetailViewController.h"

#import "LSvEntitiesDetailView.h"

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmName.h"

@interface LScEntitiesDetailViewController ()

@property (nonatomic, weak) LSvEntitiesDetailView *entitiesDetailView;

@end

@implementation LScEntitiesDetailViewController

#pragma mark - 工厂方法

+ (instancetype)entitiesDetailViewController
{
    return [[self alloc] init];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}
- (void)setupController
{
    [super setupController];
    
    self.controllerAttribute = LSSingletonControllerAttributes(LSkControllerTypeEntities);
    self.hidesBottomBarWhenPushed = YES;
    
    //创建主体View
    LSvEntitiesDetailView *entitiesDetailView = [LSvEntitiesDetailView entitiesDetailView];
    self.entitiesDetailView = entitiesDetailView;
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

#pragma mark - 重写set方法

- (void)setEntities:(LSmEntities *)entities
{
    _entities = entities;
    
    self.title = entities.name.zhCn;
    
    self.entitiesDetailView.zhNameLbl.text = entities.name.zhCn;
    self.entitiesDetailView.jaNameLbl.text = entities.name.jaJp;
    self.entitiesDetailView.iconView.image = [UIImage imageWithData:entities.picture.avatar];
}

@end //LScEntitiesDetailViewController
