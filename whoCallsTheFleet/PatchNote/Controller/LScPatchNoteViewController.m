//
//  LScPatchNoteViewController.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/6.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LScPatchNoteViewController.h"

@interface LScPatchNoteViewController ()

@end

@implementation LScPatchNoteViewController

#pragma mark - 工厂方法

+ (instancetype)patchNoteViewController
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
