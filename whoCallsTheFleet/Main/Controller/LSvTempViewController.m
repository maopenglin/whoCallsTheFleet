//
//  LSvTempViewController.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/1/14.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvTempViewController.h"
////自定义分类
//#import "NSString+LSFilePath.h"
//#import "NSArray+LSJson.h"
////第三方框架
//#import "UIImage+WebP.h"
////数据模型
//#import "LSmName.h"
//#import "LSmLink.h"
//#import "LSmArsenalAll.h"
//#import "LSmArsenalWeekday.h"
//#import "LSmEntities.h"
//#import "LSmEntitiesPicture.h"
//#import "LSmEntitiesRelation.h"
//#import "LSmItemTypeCollections.h"
//#import "LSmItemTypes.h"
//#import "LSmItems.h"
//#import "LSmShipClasses.h"
//#import "LSmShipNamesuffix.h"
//#import "LSmShipSeries.h"
//#import "LSmShipTypeCollections.h"
//#import "LSmShipTypeOrder.h"
//#import "LSmShipTypes.h"


@interface LSvTempViewController ()

#pragma mark For Test Property
//测试用控件
//@property (nonatomic, weak) IBOutlet UILabel *lbl1;
//@property (nonatomic, weak) IBOutlet UILabel *lbl2;
//@property (nonatomic, weak) IBOutlet UILabel *lbl3;
//@property (nonatomic, weak) IBOutlet UILabel *lbl4;
//@property (nonatomic, weak) IBOutlet UIImageView *img1;
//@property (nonatomic, weak) IBOutlet UIImageView *img3;
//测试用变量
//@property (nonatomic, assign) NSUInteger objIndex;

#pragma mark Data Model
//数据模型
//@property (nonatomic, strong) NSArray<LSmArsenalAll *> *arsenalAll;
//@property (nonatomic, strong) NSArray<LSmArsenalWeekday *> *arsenalWeekday;
//@property (nonatomic, strong) NSArray<LSmEntities *> *entities;
//@property (nonatomic, strong) NSArray<LSmItemTypeCollections *> *itemTypeCollections;
//@property (nonatomic, strong) NSArray<LSmItemTypes *> *itemTypes;
//@property (nonatomic, strong) NSArray<LSmItems *> *items;
//@property (nonatomic, strong) NSArray<LSmShipClasses *> *shipClasses;
//@property (nonatomic, strong) NSArray<LSmShipNamesuffix *> *shipNamesuffix;
//@property (nonatomic, strong) NSArray<LSmShipSeries *> *shipSeries;
//@property (nonatomic, strong) NSArray<LSmShipTypeCollections *> *shipTypeCollections;
//@property (nonatomic, strong) NSArray<LSmShipTypeOrder *> *shipTypeOrder;
//@property (nonatomic, strong) NSArray<LSmShipTypes *> *shipTypes;

@end

@implementation LSvTempViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.objIndex = 0;
//    [self testLoad];
//}

#pragma mark For Test Method

//- (void)testLoad
//{
//    LSmShipTypes *shipTypes = self.shipTypes[self.objIndex];
//    self.img1.image = [UIImage imageWithWebP:[NSString ls_pathOfItemPictureWithID:self.items[self.objIndex].idLS2016.stringValue]];
//    self.lbl1.text = self.shipTypes[self.objIndex].name.zhCn;
//    self.lbl2.text = self.shipTypes[self.objIndex].name.jaJp;
//    self.lbl3.text = self.shipTypes[self.objIndex].name.full;
//    self.lbl4.text = self.shipTypes[self.objIndex].name.codeGame;
//}
//- (IBAction)lastBtn:(id)sender {
//    self.objIndex --;
//    [self testLoad];
//}
//- (IBAction)nextBtn:(id)sender {
//    self.objIndex ++;
//    [self testLoad];
//}

#pragma mark 数据懒加载
//- (NSArray<LSmArsenalAll *> *)arsenalAll
//{
//    if (!_arsenalAll) {
//        _arsenalAll = [LSmArsenalAll arsenalAll];
//    }
//    return _arsenalAll;
//}
//- (NSArray<LSmArsenalWeekday *> *)arsenalWeekday
//{
//    if (!_arsenalWeekday) {
//        _arsenalWeekday = [LSmArsenalWeekday arsenalWeekday];
//    }
//    return _arsenalWeekday;
//}
//- (NSArray<LSmEntities *> *)entities
//{
//    if (!_entities) {
//        _entities = [LSmEntities entities];
//    }
//    return _entities;
//}
//- (NSArray<LSmItemTypeCollections *> *)itemTypeCollections
//{
//    if (!_itemTypeCollections) {
//        _itemTypeCollections = [LSmItemTypeCollections itemTypeCollections];
//    }
//    return _itemTypeCollections;
//}
//- (NSArray<LSmItemTypes *> *)itemTypes
//{
//    if (!_itemTypes) {
//        _itemTypes = [LSmItemTypes itemTypes];
//    }
//    return _itemTypes;
//}
//- (NSArray<LSmItems *> *)items
//{
//    if (!_items) {
//        _items = [LSmItems items];
//    }
//    return _items;
//}
//- (NSArray<LSmShipClasses *> *)shipClasses
//{
//    if (!_shipClasses) {
//        _shipClasses = [LSmShipClasses shipClasses];
//    }
//    return _shipClasses;
//}
//- (NSArray<LSmShipNamesuffix *> *)shipNamesuffix
//{
//    if (!_shipNamesuffix) {
//        _shipNamesuffix = [LSmShipNamesuffix shipNamesuffix];
//    }
//    return _shipNamesuffix;
//}
//-(NSArray<LSmShipSeries *> *)shipSeries
//{
//    if (!_shipSeries) {
//        _shipSeries = [LSmShipSeries shipSeries];
//    }
//    return _shipSeries;
//}
//-(NSArray<LSmShipTypeCollections *> *)shipTypeCollections
//{
//    if (!_shipTypeCollections) {
//        _shipTypeCollections = [LSmShipTypeCollections shipTypeCollections];
//    }
//    return _shipTypeCollections;
//}
//- (NSArray<LSmShipTypeOrder *> *)shipTypeOrder
//{
//    if (!_shipTypeOrder) {
//        _shipTypeOrder = [LSmShipTypeOrder shipTypeOrder];
//    }
//    return _shipTypeOrder;
//}
//-(NSArray<LSmShipTypes *> *)shipTypes
//{
//    if (!_shipTypes) {
//        _shipTypes = [LSmShipTypes shipTypes];
//    }
//    return _shipTypes;
//}

@end
