//
//  LScArsenalViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/27.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScArsenalViewController.h"

@interface LScArsenalViewController ()

@end

@implementation LScArsenalViewController

#pragma mark - 工厂方法

+ (instancetype)arsenalViewController
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
    // Do any additional setup after loading the view.
}

@end
