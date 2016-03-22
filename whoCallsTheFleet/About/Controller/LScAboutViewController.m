//
//  LScAboutViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/1.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScAboutViewController.h"

@interface LScAboutViewController ()

@end

@implementation LScAboutViewController

#pragma mark - 工厂方法

+ (instancetype)aboutViewController
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
