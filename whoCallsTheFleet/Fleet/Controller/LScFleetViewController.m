//
//  LScFleetViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScFleetViewController.h"
#import "TTTAttributedLabel.h"

@interface LScFleetViewController ()<TTTAttributedLabelDelegate>

@end

@implementation LScFleetViewController

#pragma mark - 工厂方法

+ (instancetype)fleetViewController
{
    return [[self alloc] init];
}
- (instancetype)init
{
    if (self = [super init]) {
        ;
    }
    return self;
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
