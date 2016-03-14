//
//  LSvEntitiesIllustratorTableView.h
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSmEntities;

@interface LSvEntitiesIllustratorTableView : UITableView


@property (nonatomic, strong) NSArray<LSmEntities *> *entitiesIllustrator;
/**
 *  快速创建
 */
+ (instancetype)entitienIllustratorTableView;

@end
