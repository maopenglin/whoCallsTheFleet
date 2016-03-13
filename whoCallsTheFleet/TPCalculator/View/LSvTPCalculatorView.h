//
//  LSvTPCalculatorView.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/10.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTTAttributedLabel;

@interface LSvTPCalculatorView : UIView

@property (nonatomic, strong) UIColor *color;
//控件连线
@property (nonatomic, weak) IBOutlet TTTAttributedLabel *bottomLabel;
@property (nonatomic, weak) IBOutlet UIView *middleView;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

/**
 *  创建TPCalculatorView
 */
+ (instancetype)TPCalculatorView;

@end
