//
//  LSvOptionHeaderView.h
//  whoCallsTheFleet
//
//  Created by Larry Sue on 16/3/5.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSvOptionHeaderView : UIView

//标题
@property (nonatomic, copy) NSString *title;

/**
 *  工厂方法
 */
+ (instancetype)optionHeaderView;

@end //LSvOptionHeaderView
