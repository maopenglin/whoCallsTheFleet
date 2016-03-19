//
//  LSvTPCalculatorCountView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/11.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvTPCalculatorCountView.h"
#import "LSmTPCalculatorCount.h"
#import "LSmControllerAttributes.h"

@interface LSvTPCalculatorCountView ()

@property (nonatomic, weak) IBOutlet UIButton *addBtn;
@property (nonatomic, weak) IBOutlet UIButton *subBtn;

@end
@implementation LSvTPCalculatorCountView

#pragma mark - 快速创建

+ (instancetype)TPCalculatorCountView
{
    NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"LSvTPCalculatorCountView" owner:nil options:nil];
    LSvTPCalculatorCountView *TPCalculatorCountView = (LSvTPCalculatorCountView *)nibArr.lastObject;
    
    return TPCalculatorCountView;
}

#pragma mark - 连线方法

- (IBAction)addBtnDidClick
{
    NSInteger count = self.countLbl.text.integerValue;
    //计数加一
    count ++;
    self.countLbl.text = [NSString stringWithFormat:@"%ld",(long)count];
    self.LSbCountChanged(self.countLbl.text);
}
- (IBAction)subBtnDidClick
{
    NSInteger count = self.countLbl.text.integerValue;
    //计数减1
    count --;
    if (count < 0) return;
    self.countLbl.text = [NSString stringWithFormat:@"%ld",(long)count];
    self.LSbCountChanged(self.countLbl.text);
}

#pragma mark - 重写set方法

- (void)setTPCalculatorCount:(LSmTPCalculatorCount *)TPCalculatorCount
{
    _TPCalculatorCount = TPCalculatorCount;
    
    self.titleLbl.text = TPCalculatorCount.title;
    self.countLbl.text = TPCalculatorCount.count;
    
    self.titleLbl.textColor = LSSingleton(LSkControllerTypeTPCalculator).color;
    self.countLbl.textColor = LSSingleton(LSkControllerTypeTPCalculator).color;
    
    [self.addBtn setTitleColor:LSSingleton(LSkControllerTypeTPCalculator).color forState:UIControlStateNormal];
    [self.subBtn setTitleColor:LSSingleton(LSkControllerTypeTPCalculator).color forState:UIControlStateNormal];
}

@end
