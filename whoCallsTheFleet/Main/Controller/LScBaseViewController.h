//
//  LScBaseViewController.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSmControllerAttributes.h"

@interface LScBaseViewController : UIViewController

//控制器属性表
@property (nonatomic, strong) LSmControllerAttributes *controllerAttribute;
//背景图片
@property (nonatomic, weak) UIImageView *backgroundImgView;

//主体View
@property (nonatomic, weak) UIView *mainView;
//主体tableView
@property (nonatomic, weak) UITableView *mainTableView;
//主体collectionView
@property (nonatomic, weak) UICollectionView *mainCollectionView;


@end
