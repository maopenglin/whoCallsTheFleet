//
//  LScEntitiesDetailViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/20.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScEntitiesDetailViewController.h"

@implementation LScEntitiesDetailViewController

#pragma mark - 工厂方法

+ (instancetype)entitiesDetailViewController
{
    return [[self alloc] init];
}
- (instancetype)init
{
    if (self = [super init]) {
        self.controllerAttribute = LSSingletonControllerAttributes(LSkControllerTypeEntities);
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

@end //LScEntitiesDetailViewController
