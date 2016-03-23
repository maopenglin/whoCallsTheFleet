//
//  LSvEntitiesDetailView.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSvEntitiesDetailView : UIView

@property (nonatomic, weak) IBOutlet UITableView *shipTableView;
@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic, weak) IBOutlet UILabel *zhNameLbl;
@property (nonatomic, weak) IBOutlet UILabel *jaNameLbl;
@property (nonatomic, weak) IBOutlet UIButton *linkBtn;
/**
 *  工厂方法
 */
+ (instancetype)entitiesDetailView;

@end
