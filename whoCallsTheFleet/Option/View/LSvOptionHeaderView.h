//
//  LSvOptionHeaderView.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSvOptionHeaderView : UIView

//标题
@property (nonatomic, copy) NSString *title;
//主题色
@property (nonatomic, strong) UIColor *color;

/**
 *  快速创建optionHeaderView
 */
+ (instancetype)optionHeaderView;

@end
