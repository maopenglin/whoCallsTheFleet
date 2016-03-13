//
//  LSvOptionTableViewCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvOptionTableViewCell.h"

#import "LSmOptionItem.h"

@interface LSvOptionTableViewCell ()

@end

@implementation LSvOptionTableViewCell

#pragma mark - 重写构造方法

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

#pragma mark - 快速创建

+ (instancetype)optionTableViewCell:(UITableView *)tableView
{
    LSvOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"optionCell"];
    if (!cell) {
        cell = [[LSvOptionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"optionCell"];
    }
    return cell;
}

- (void)setup
{
    //设置背景为透明
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - 重写布局

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //重设右侧控件frame
    CGFloat accViewX, accViewY, accViewW, accViewH;
    if ([self isTextFieldType]) {
        accViewX = CGRectGetWidth(self.frame) - 85;
        accViewY = CGRectGetMidY(self.contentView.frame) - 15;
        accViewW = 70;
        accViewH = 30;
    } else {
        accViewX = CGRectGetWidth(self.frame) - 70;
        accViewY = CGRectGetMidY(self.contentView.frame) - 15;
        accViewW = 0;
        accViewH = 0;
    }
    self.accessoryView.frame = CGRectMake(accViewX, accViewY, accViewW, accViewH);
    
    //重设输入附加栏frame
    self.accessoryTxt.inputAccessoryView.frame = CGRectMake(0, 0, 0, 44);
}

#pragma mark - 右侧控件回调

- (void)accessoryValueChanged
{
    //判断类型
    if ([self isTextFieldType]) {
        //过滤不正常值
        if (self.accessoryTxt.text.integerValue > 120) {
            self.accessoryTxt.text = @"120";
        } else if(self.accessoryTxt.text.integerValue < 0) {
            self.accessoryTxt.text = @"0";
        }
        //保存至模型
        self.optionItem.value = self.accessoryTxt.text;
    } else {
        //保存至模型
        self.optionItem.value = self.accessorySwc.on?@"1":@"0";
    }
    //调用block 参数：模型
    self.LSbAccessoryValueChanged(self.optionItem.value);
}

#pragma mark - 键盘附加栏按钮回调

- (void)inputAccessoryBtnDidClick
{
    [self accessoryValueChanged];
}

#pragma mark - 重写set方法

- (void)setOptionItem:(LSmOptionItem *)optionItem
{
    _optionItem = optionItem;
    
    //设置cell文本格式
    self.textLabel.text = self.optionItem.describe;
    self.textLabel.font = LSFontWithSize(18);
    
    //设置右侧控件
    if ([self isTextFieldType]) {
        //创建
        UITextField *textField             = [[UITextField alloc] init];
        UIToolbar *inputAccessoryView      = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
        UIBarButtonItem *inputAccessoryBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(inputAccessoryBtnDidClick)];
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        inputAccessoryView.items = @[flexibleItem, inputAccessoryBtn];
        //设置
        self.accessoryView                                   = textField;
        self.accessoryTxt                                    = textField;
        self.accessoryTxt.inputAccessoryView                 = inputAccessoryView;
    } else {
        //创建
        UISwitch *Switch                                     = [[UISwitch alloc] init];
        //设置
        self.accessoryView                                   = Switch;
        self.accessorySwc                                    = Switch;
    }
    
    //控件绑定方法
    [self.accessoryTxt addTarget:self action:@selector(accessoryValueChanged) forControlEvents:UIControlEventEditingDidEnd];
    [self.accessorySwc addTarget:self action:@selector(accessoryValueChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    
    self.textLabel.textColor               = color;

    self.accessoryTxt.textColor            = color;
    self.accessoryTxt.textAlignment        = NSTextAlignmentCenter;
    self.accessoryTxt.borderStyle          = UITextBorderStyleRoundedRect;
    self.accessoryTxt.placeholder          = @"等级";
    self.accessoryTxt.keyboardType         = UIKeyboardTypeNumberPad;
    self.accessoryTxt.clearsOnBeginEditing = YES;
    self.accessoryTxt.text                 = self.optionItem.value;

    self.accessoryTxt.inputAccessoryView.backgroundColor = color;
    self.accessoryTxt.inputAccessoryView.tintColor       = color;
    
    self.accessorySwc.onTintColor          = color;
    self.accessorySwc.on                   = self.optionItem.value.boolValue;
}

#pragma mark - 其他方法

- (BOOL)isTextFieldType
{
    if (self.optionItem.accessoryClass == [UITextField class]) {
        return YES;
    } else {
        return NO;
    }
}

@end
