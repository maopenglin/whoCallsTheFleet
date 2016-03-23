//
//  LSvOtherMenuView.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/28.
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

#pragma mark - 工厂方法

+ (instancetype)menuView
{
    return  (LSvMenuView *)[[NSBundle mainBundle] loadNibNamed:@"LSvMenuView" owner:nil options:nil].lastObject;
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
    //添加左滑手势响应 关闭菜单
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(menuViewLeftSwipe)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeGestureRecognizer];
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

#pragma mark - 手势回调方法

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
