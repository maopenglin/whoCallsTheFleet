//
//  LSvTPCalculatorCountView.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/11.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmTPCalculatorCount;

@interface LSvTPCalculatorCountView : UIView

//控件连线
@property (nonatomic, weak) IBOutlet UILabel *titleLbl;
@property (nonatomic, weak) IBOutlet UILabel *countLbl;

//色彩
@property (nonatomic, strong) UIColor *color;
//模型
@property (nonatomic, strong) LSmTPCalculatorCount *TPCalculatorCount;

//回调block
@property (nonatomic, copy) void (^LSbCountChanged)(NSString *count);

/**
 *  快速创建
 */
+ (instancetype)TPCalculatorCountView;

@end
