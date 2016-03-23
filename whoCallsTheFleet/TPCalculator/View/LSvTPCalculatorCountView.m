//
//  LSvTPCalculatorCountView.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/11.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvTPCalculatorCountView.h"
#import "LSmTPCalculatorCount.h"
#import "LSmControllerAttributes.h"

@interface LSvTPCalculatorCountView ()

@property (nonatomic, weak) IBOutlet UIButton *addBtn;
@property (nonatomic, weak) IBOutlet UIButton *subBtn;
//控件连线
@property (nonatomic, weak) IBOutlet UILabel *titleLbl;
@property (nonatomic, weak) IBOutlet UILabel *countLbl;

@end

@implementation LSvTPCalculatorCountView

#pragma mark - 工厂方法

+ (instancetype)TPCalculatorCountView
{
    return (LSvTPCalculatorCountView *)[[NSBundle mainBundle] loadNibNamed:@"LSvTPCalculatorCountView" owner:nil options:nil].lastObject;
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
    [super awakeFromNib];
    
    self.titleLbl.textColor = LSSingletonControllerAttributes(LSkControllerTypeTPCalculator).color;
    self.countLbl.textColor = LSSingletonControllerAttributes(LSkControllerTypeTPCalculator).color;
    
    [self.addBtn setTitleColor:LSSingletonControllerAttributes(LSkControllerTypeTPCalculator).color forState:UIControlStateNormal];
    [self.subBtn setTitleColor:LSSingletonControllerAttributes(LSkControllerTypeTPCalculator).color forState:UIControlStateNormal];
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
}

@end
