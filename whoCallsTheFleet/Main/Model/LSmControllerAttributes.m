//
//  LSmControllerAttributes.m
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/2/29.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSmControllerAttributes.h"

#import "LScFleetViewController.h"
#import "LScShipsViewController.h"
#import "LScItemsViewController.h"
#import "LScArsenalViewController.h"
#import "LScEntitiesViewController.h"

#import "LScTPCalculatorViewController.h"
#import "LScOptionViewController.h"
#import "LScPatchNoteViewController.h"
#import "LScAboutViewController.h"

@interface LSmControllerAttributes ()

//控制器类型
@property (nonatomic, assign) LSkControllerType type;
//控制器的类
@property (nonatomic, assign) Class class;
//控制器的标题
@property (nonatomic, copy) NSString *title;
//控制器的主题色
@property (nonatomic, strong) UIColor *color;
//控制器的图标
@property (nonatomic, copy) NSString *itemIconName;
//控制器背景图片
@property (nonatomic, strong) UIImage *backgroundImage;

@end

@implementation LSmControllerAttributes

+(NSArray<LSmControllerAttributes *> *)sharedControllerAttributes
{
    static NSArray<LSmControllerAttributes *> *controllerAttributes = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        /*** 赋值特有属性 ***/
        //TabVc子控制器
        LSmControllerAttributes *fleetControllerAtt    = [[LSmControllerAttributes alloc] init];
        LSmControllerAttributes *shipsControllerAtt    = [[LSmControllerAttributes alloc] init];
        LSmControllerAttributes *itemsControllerAtt    = [[LSmControllerAttributes alloc] init];
        LSmControllerAttributes *arsenalControllerAtt  = [[LSmControllerAttributes alloc] init];
        LSmControllerAttributes *entitiesControllerAtt = [[LSmControllerAttributes alloc] init];
        
        fleetControllerAtt.type            = LSkControllerTypeFleet;
        shipsControllerAtt.type            = LSkControllerTypeShips;
        itemsControllerAtt.type            = LSkControllerTypeItems;
        arsenalControllerAtt.type          = LSkControllerTypeArsenal;
        entitiesControllerAtt.type         = LSkControllerTypeEntities;

        fleetControllerAtt.class           = [LScFleetViewController class];
        shipsControllerAtt.class           = [LScShipsViewController class];
        itemsControllerAtt.class           = [LScItemsViewController class];
        arsenalControllerAtt.class         = [LScArsenalViewController class];
        entitiesControllerAtt.class        = [LScEntitiesViewController class];

        fleetControllerAtt.title           = @"舰队";
        shipsControllerAtt.title           = @"舰娘";
        itemsControllerAtt.title           = @"装备";
        arsenalControllerAtt.title         = @"改修工厂";
        entitiesControllerAtt.title        = @"声优&画师";

        fleetControllerAtt.color           = LSColorWithRGBA(90 , 143, 217, 1.0);
        shipsControllerAtt.color           = LSColorWithRGBA(134, 181, 182, 1.0);
        itemsControllerAtt.color           = LSColorWithRGBA(237, 72 , 97 , 1.0);
        arsenalControllerAtt.color         = LSColorWithRGBA(255, 181, 51 , 1.0);
        entitiesControllerAtt.color        = LSColorWithRGBA(196, 98 , 181, 1.0);

        fleetControllerAtt.itemIconName    = @"fleetItemIcon";
        shipsControllerAtt.itemIconName    = @"shipsItemIcon";
        itemsControllerAtt.itemIconName    = @"itemsItemIcon";
        arsenalControllerAtt.itemIconName  = @"arsenalItemIcon";
        entitiesControllerAtt.itemIconName = @"entitiesItemIcon";
        
        
        //菜单栏子控制器
        LSmControllerAttributes *tpCalculatorControllerAtt = [[LSmControllerAttributes alloc] init];
        LSmControllerAttributes *optionControllerAtt       = [[LSmControllerAttributes alloc] init];
        LSmControllerAttributes *patchNoteControllerAtt    = [[LSmControllerAttributes alloc] init];
        LSmControllerAttributes *aboutControllerAtt        = [[LSmControllerAttributes alloc] init];
        
        tpCalculatorControllerAtt.type         = LSkControllerTypeTPCalculator;
        optionControllerAtt.type               = LSkControllerTypeOption;
        patchNoteControllerAtt.type            = LSkControllerTypePatchNote;
        aboutControllerAtt.type                = LSkControllerTypeAbout;

        tpCalculatorControllerAtt.class        = [LScTPCalculatorViewController class];
        optionControllerAtt.class              = [LScOptionViewController class];
        patchNoteControllerAtt.class           = [LScPatchNoteViewController class];
        aboutControllerAtt.class               = [LScAboutViewController class];

        tpCalculatorControllerAtt.title        = @"TP计算器";
        optionControllerAtt.title              = @"设置";
        patchNoteControllerAtt.title           = @"更新记录";
        aboutControllerAtt.title               = @"关于";

        tpCalculatorControllerAtt.color        = LSColorWithRGBA(190, 190, 190, 1.0);
        optionControllerAtt.color              = LSColorWithRGBA(190, 190, 190, 1.0);
        patchNoteControllerAtt.color           = LSColorWithRGBA(190, 190, 190, 1.0);
        aboutControllerAtt.color               = LSColorWithRGBA(190, 190, 190, 1.0);

        tpCalculatorControllerAtt.itemIconName = nil;
        optionControllerAtt.itemIconName       = nil;
        patchNoteControllerAtt.itemIconName    = nil;
        aboutControllerAtt.itemIconName        = nil;
        
        //包装成数组
        controllerAttributes = @[//tableViewConroller的子控制器
                                fleetControllerAtt,
                                shipsControllerAtt,
                                itemsControllerAtt,
                                arsenalControllerAtt,
                                entitiesControllerAtt,
                                //其他控制器
                                tpCalculatorControllerAtt,
                                optionControllerAtt,
                                patchNoteControllerAtt,
                                aboutControllerAtt];
        
        /*** 赋值共有属性 ***/
        //随机选取背景图片
        int rndNum = arc4random()%15;
        NSString *imageName = [NSString stringWithFormat:@"tbg%d",rndNum];
        //设置背景图
        [controllerAttributes enumerateObjectsUsingBlock:^(LSmControllerAttributes * _Nonnull controllerAtt, NSUInteger idx, BOOL * _Nonnull stop) {
            controllerAtt.backgroundImage = [UIImage imageNamed:imageName];
        }];
    });
    
    return controllerAttributes;
}

@end
