//
//  LSvEntitiesIllustratorCell.m
//  whoCallsTheFleet
//
//  Created by 苏俊良 on 16/3/12.
//  Copyright © 2016年 LarrySue. All rights reserved.
//

#import "LSvEntitiesIllustratorCell.h"

#import "LSmEntities.h"
#import "LSmName.h"

@interface LSvEntitiesIllustratorCell ()

@property (nonatomic, weak) IBOutlet UILabel *nameView;

@end

@implementation LSvEntitiesIllustratorCell

+ (instancetype)entitiesIllustratorCell:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    LSvEntitiesIllustratorCell *cell = [tableView dequeueReusableCellWithIdentifier:LSIdentifierEntitiesIllustratorCell forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - 重写set方法

- (void)setIllustrator:(LSmEntities *)illustrator
{
    _illustrator = illustrator;
    
    self.nameView.text = illustrator.name.jaJp;
}
- (void)setColor:(UIColor *)color
{
    _color = color;
    
    self.nameView.textColor = color;
}

-(void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end
