//
//  LSvEntitiesDetailView.m
//  whoCallsTheFleet
//
//  Created by LarrySue on 16/3/23.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesDetailView.h"

#import "LSmControllerAttributes.h"

@interface LSvEntitiesDetailView ()

@property (nonatomic, weak) IBOutlet UILabel *tipsLbl;

@end

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
    
    //设置属性
    self.shipTableView.separatorStyle               = UITableViewCellSeparatorStyleNone;
    self.shipTableView.showsVerticalScrollIndicator = NO;
    //设置主题色
    UIColor *color = LSSingletonControllerAttributes(LSkControllerTypeEntities).color;

    self.zhNameLbl.textColor = color;
    self.jaNameLbl.textColor = color;
    self.typeLbl.textColor   = color;
    self.tipsLbl.textColor   = color;
    
    //设置button外观
    [self.linkPixivBtn setTitle:LSIconfontPixiv forState:UIControlStateNormal];
    [self.linkTwitterBtn setTitle:LSIconfontTwitter forState:UIControlStateNormal];
    [self.linkWikipediaBtn setTitle:LSIconfontWikipedia forState:UIControlStateNormal];
    [self.linkHomepageBtn setTitle:LSIconfontHomepage forState:UIControlStateNormal];
    //设置字体
    self.linkPixivBtn.titleLabel.font = LSFontIconSize(20);
    self.linkTwitterBtn.titleLabel.font = LSFontIconSize(20);
    self.linkWikipediaBtn.titleLabel.font = LSFontIconSize(20);
    self.linkHomepageBtn.titleLabel.font = LSFontIconSize(20);
    //设置可用时的颜色
    [self.linkPixivBtn setTitleColor:color forState:UIControlStateNormal];
    [self.linkTwitterBtn setTitleColor:color forState:UIControlStateNormal];
    [self.linkWikipediaBtn setTitleColor:color forState:UIControlStateNormal];
    [self.linkHomepageBtn setTitleColor:color forState:UIControlStateNormal];
    //设置不可用时的颜色
    [self.linkPixivBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.linkTwitterBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.linkWikipediaBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.linkHomepageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
}

- (IBAction)twitterLinkBtnDidClick
{
    self.LSbLinkBtnDidClick(LSkLinkTypeTwitter);
}
- (IBAction)wikipediaLinkBtnDidClick
{
    self.LSbLinkBtnDidClick(LSkLinkTypeWikipedia);
}
- (IBAction)pixivLinkBtnDidClick
{
    self.LSbLinkBtnDidClick(LSkLinkTypePixiv);
}
- (IBAction)homepageLinkBtnDidClick
{
    self.LSbLinkBtnDidClick(LSkLinkTypeHomepage);
}

@end
