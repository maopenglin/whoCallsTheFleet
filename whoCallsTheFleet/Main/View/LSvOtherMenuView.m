//
//  LSvOtherMenuView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvOtherMenuView.h"

@interface LSvOtherMenuView ()

//按钮控件连线
@property (nonatomic, weak) IBOutlet UIButton *tpCalculatorBtnView;
@property (nonatomic, weak) IBOutlet UIButton *optionBtnView;
@property (nonatomic, weak) IBOutlet UIButton *patchNoteBtnView;
@property (nonatomic, weak) IBOutlet UIButton *aboutBtnView;
@property (nonatomic, weak) IBOutlet UIVisualEffectView *maskBlurEffectView;

@end

@implementation LSvOtherMenuView

+ (instancetype)otherMenuView
{
    NSArray *nibArr=[[NSBundle mainBundle] loadNibNamed:@"LSvOtherMenuView" owner:nil options:nil];

    LSvOtherMenuView *otherMenuView = (LSvOtherMenuView *)nibArr.lastObject;
    
    //添加左滑手势响应 关闭菜单
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:otherMenuView action:@selector(otherMenuViewLeftSwipe)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [otherMenuView addGestureRecognizer:swipeGestureRecognizer];
    
    //添加背景模糊
//    UIBlurEffect *maskBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVisualEffectView *maskBlurEffectView = [[UIVisualEffectView alloc] initWithFrame:otherMenuView.bounds];
//    maskBlurEffectView.effect = maskBlurEffect;
//    [otherMenuView.backgroundView addSubview:maskBlurEffectView];
    
    return  otherMenuView;
}

#pragma mark - 方法连线

- (IBAction)tpCalculatorBtnViewDidClick:(id)sender {
    [self.delegate otherMenuViewBtnDidClick:sender WithType:LSkControllerTypeTPCalculator];
}

- (IBAction)optionBtnViewDidClick:(id)sender {
    [self.delegate otherMenuViewBtnDidClick:sender WithType:LSkControllerTypeOption];
}

- (IBAction)patchNoteBtnViewDidClick:(id)sender {
    [self.delegate otherMenuViewBtnDidClick:sender WithType:LSkControllerTypePatchNote];
}

- (IBAction)aboutBtnViewDidClick:(id)sender {
    [self.delegate otherMenuViewBtnDidClick:sender WithType:LSkControllerTypeAbout];
}

#pragma mark - 
- (void)otherMenuViewLeftSwipe
{
    if (self.isOpen) {
        [self.delegate otherMenuViewLeftSwipe];
    }
}
#pragma mark - 重写set方法

- (void)setDelegate:(id<LSpOtherMenuViewDelegate>)delegate
{
    _delegate = delegate;
    
    //设置按钮文字
    [self.tpCalculatorBtnView setTitle:self.controllerAttributes[LSkControllerTypeTPCalculator].title forState:UIControlStateNormal] ;
    [self.optionBtnView setTitle:self.controllerAttributes[LSkControllerTypeOption].title forState:UIControlStateNormal] ;
    [self.patchNoteBtnView setTitle:self.controllerAttributes[LSkControllerTypePatchNote].title forState:UIControlStateNormal] ;
    [self.aboutBtnView setTitle:self.controllerAttributes[LSkControllerTypeAbout].title forState:UIControlStateNormal] ;
}

#pragma mark - Lazy Load

- (NSArray<LSmControllerAttributes *> *)controllerAttributes
{
    if (!_controllerAttributes) {
        _controllerAttributes = [LSmControllerAttributes sharedControllerAttributes];
    }
    
    return _controllerAttributes;
}
@end
