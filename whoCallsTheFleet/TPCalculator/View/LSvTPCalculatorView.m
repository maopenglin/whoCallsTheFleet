//
//  LSvTPCalculatorView.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/10.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvTPCalculatorView.h"

#import "LSmControllerAttributes.h"

@interface LSvTPCalculatorView ()

//控件连线
@property (nonatomic, weak) IBOutlet UILabel *topLabel;


@end

@implementation LSvTPCalculatorView

#pragma mark - 工厂方法

+ (instancetype)TPCalculatorView
{
    NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"LSvTPCalculatorView" owner:nil options:nil];
    LSvTPCalculatorView *TPCalculatorView = (LSvTPCalculatorView *)nibArr.lastObject;
    
    return TPCalculatorView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        ;
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        ;
    }
    return self;
}
- (void)awakeFromNib
{
    [self setup];
}
/**
 *  设置属性
 */
- (void)setup
{
    self.topLabel.textColor    = LSSingletonControllerAttributes(LSkControllerTypeTPCalculator).color;
    self.resultLabel.textColor = LSSingletonControllerAttributes(LSkControllerTypeTPCalculator).color;
}

@end
