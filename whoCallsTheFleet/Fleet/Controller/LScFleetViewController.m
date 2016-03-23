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
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {    }
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
}

#pragma mark - controller生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
