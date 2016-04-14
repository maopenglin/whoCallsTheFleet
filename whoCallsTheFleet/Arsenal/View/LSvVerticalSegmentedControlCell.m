//
//  LSvVerticalSegmentedControlCell.m
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/3/28.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvVerticalSegmentedControlCell.h"

@interface LSvVerticalSegmentedControlCell ()

@property (nonatomic, weak) UIView *lineView;

@end

@implementation LSvVerticalSegmentedControlCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *lable = [[UILabel alloc] init];
        self.lable = lable;
        [self.contentView addSubview:self.lable];
        self.backgroundColor = LSColorClear;
        
        [self.lable setTextAlignment:NSTextAlignmentCenter];
        
        UIView *lineView = [[UIView alloc] init];
        self.lineView = lineView;
        [self.contentView addSubview:lineView];
        
        self.selectedBackgroundView = [[UIView alloc] init];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.lable.frame = self.bounds;
    self.selectedBackgroundView.frame = self.bounds;
    
    CGFloat X= 0;
    CGFloat Y= self.bounds.size.height-1;
    CGFloat W= self.bounds.size.width;
    CGFloat H= 1;
    
    self.lineView.frame = CGRectMake(X, Y, W, H);
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    
    self.lable.textColor = color;
    self.lineView.backgroundColor = color;
    self.selectedBackgroundView.backgroundColor = color;
}

@end
