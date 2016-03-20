//
//  LSvOtherMenuView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/2/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvMenuView.h"

@interface LSvMenuView ()

//按钮控件连线
@property (nonatomic, weak) IBOutlet UIButton *tpCalculatorBtnView;
@property (nonatomic, weak) IBOutlet UIButton *optionBtnView;
@property (nonatomic, weak) IBOutlet UIButton *patchNoteBtnView;
@property (nonatomic, weak) IBOutlet UIButton *aboutBtnView;
@property (nonatomic, weak) IBOutlet UIVisualEffectView *maskBlurEffectView;

@end

@implementation LSvMenuView

+ (instancetype)menuView
{
    NSArray *nibArr=[[NSBundle mainBundle] loadNibNamed:@"LSvMenuView" owner:nil options:nil];

    LSvMenuView *menuView = (LSvMenuView *)nibArr.lastObject;
    
    //添加左滑手势响应 关闭菜单
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:menuView action:@selector(menuViewLeftSwipe)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [menuView addGestureRecognizer:swipeGestureRecognizer];
    
    return  menuView;
}

#pragma mark - 方法连线

- (IBAction)tpCalculatorBtnViewDidClick:(id)sender {
    [self.delegate menuViewBtnDidClick:sender WithType:LSkControllerTypeTPCalculator];
}

- (IBAction)optionBtnViewDidClick:(id)sender {
    [self.delegate menuViewBtnDidClick:sender WithType:LSkControllerTypeOption];
}

- (IBAction)patchNoteBtnViewDidClick:(id)sender {
    [self.delegate menuViewBtnDidClick:sender WithType:LSkControllerTypePatchNote];
}

- (IBAction)aboutBtnViewDidClick:(id)sender {
    [self.delegate menuViewBtnDidClick:sender WithType:LSkControllerTypeAbout];
}

#pragma mark - 
- (void)menuViewLeftSwipe
{
    if (self.isOpen) {
        [self.delegate menuViewLeftSwipe];
    }
}
#pragma mark - 重写set方法

- (void)setDelegate:(id<LSpMenuViewDelegate>)delegate
{
    _delegate = delegate;
    
    //设置按钮文字
    [self.tpCalculatorBtnView setTitle:LSSingletonControllerAttributes(LSkControllerTypeTPCalculator).title forState:UIControlStateNormal] ;
    [self.optionBtnView setTitle:LSSingletonControllerAttributes(LSkControllerTypeOption).title forState:UIControlStateNormal] ;
    [self.patchNoteBtnView setTitle:LSSingletonControllerAttributes(LSkControllerTypePatchNote).title forState:UIControlStateNormal] ;
    [self.aboutBtnView setTitle:LSSingletonControllerAttributes(LSkControllerTypeAbout).title forState:UIControlStateNormal] ;
}

@end
