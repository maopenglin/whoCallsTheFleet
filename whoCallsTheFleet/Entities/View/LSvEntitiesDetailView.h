//
//  LSvEntitiesDetailView.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSmLink.h"

@interface LSvEntitiesDetailView : UIView

//控件连线
@property (nonatomic, weak) IBOutlet UITableView *shipTableView;
@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic, weak) IBOutlet UILabel *zhNameLbl;
@property (nonatomic, weak) IBOutlet UILabel *jaNameLbl;
@property (nonatomic, weak) IBOutlet UILabel *typeLbl;
@property (nonatomic, weak) IBOutlet UIButton *linkWikipediaBtn;
@property (nonatomic, weak) IBOutlet UIButton *linkTwitterBtn;
@property (nonatomic, weak) IBOutlet UIButton *linkHomepageBtn;
@property (nonatomic, weak) IBOutlet UIButton *linkPixivBtn;

//回调Block
@property (nonatomic, copy) void (^LSbLinkBtnDidClick)(LSkLinkType);

/**
 *  工厂方法
 */
+ (instancetype)entitiesDetailView;

@end
