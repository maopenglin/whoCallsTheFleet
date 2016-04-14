//
//  LSvEntitiesDetailView.h
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/3/23.
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
/**
 *  点击链接按钮的回调Block
 */
@property (nonatomic, copy) void (^LSbLinkBtnDidClick)(LSkLinkType);
/**
 *  设置中文姓名富文本的回调Block
 */
//@property (nonatomic, copy) NSAttributedString *(^LSbSetZhNameLblAttText)();

/**
 *  工厂方法
 */
+ (instancetype)entitiesDetailView;

@end
