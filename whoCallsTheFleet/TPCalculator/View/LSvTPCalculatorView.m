//
//  LSvTPCalculatorView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/10.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvTPCalculatorView.h"

#import "LSmControllerAttributes.h"

@interface LSvTPCalculatorView ()

//控件连线
@property (nonatomic, weak) IBOutlet UILabel *topLabel;

@end

@implementation LSvTPCalculatorView

#pragma mark - 快速创建

+ (instancetype)TPCalculatorView
{
    NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"LSvTPCalculatorView" owner:nil options:nil];
    LSvTPCalculatorView *TPCalculatorView = (LSvTPCalculatorView *)nibArr.lastObject;
    
    return TPCalculatorView;
}

- (void)awakeFromNib
{
    self.topLabel.textColor    = LSSingleton(LSkControllerTypeTPCalculator).color;
    self.resultLabel.textColor = LSSingleton(LSkControllerTypeTPCalculator).color;
}

@end
