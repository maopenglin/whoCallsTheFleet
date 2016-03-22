//
//  LSvTPCalculatorView.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/10.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTTAttributedLabel;

@interface LSvTPCalculatorView : UIView

//控件连线
@property (nonatomic, weak) IBOutlet TTTAttributedLabel *bottomLabel;
@property (nonatomic, weak) IBOutlet UIView *middleView;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

/**
 *  工厂方法
 */
+ (instancetype)TPCalculatorView;

@end
