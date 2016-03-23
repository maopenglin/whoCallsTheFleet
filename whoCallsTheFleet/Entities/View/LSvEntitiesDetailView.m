//
//  LSvEntitiesDetailView.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesDetailView.h"

#import "LSmControllerAttributes.h"

@implementation LSvEntitiesDetailView

+ (instancetype)entitiesDetailView
{
    return (LSvEntitiesDetailView *)[[NSBundle mainBundle] loadNibNamed:@"LSvEntitiesDetailView" owner:nil options:nil].lastObject;
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
    
    UIColor *color = LSSingletonControllerAttributes(LSkControllerTypeEntities).color;
    self.jaNameLbl.textColor = color;
    self.zhNameLbl.textColor = color;
}

@end
