//
//  LScEntitiesDetailViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/20.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesDetailViewController.h"

#import "LSmEntities.h"
#import "LSmEntitiesPicture.h"
#import "LSmName.h"

@implementation LScEntitiesDetailViewController

#pragma mark - 工厂方法

+ (instancetype)entitiesDetailViewController
{
    return [[self alloc] init];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupController];
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setupController];
    }
    return self;
}

- (void)setupController
{
    [super setupController];
    
    self.controllerAttribute = LSSingletonControllerAttributes(LSkControllerTypeEntities);
    self.hidesBottomBarWhenPushed = YES;
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

#pragma mark - 重写set方法

- (void)setEntities:(LSmEntities *)entities
{
    _entities = entities;
    
    self.title = entities.name.zhCn;
}

@end //LScEntitiesDetailViewController
