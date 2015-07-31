//
//  SideCell.m
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "SideCell.h"
#import "SideItem.h"
@implementation SideCell
 NSString *ID = @"side";
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    SideCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[self  alloc]initWithStyle:style reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    

    return cell;
}
- (void)setItem:(SideItem *)item
{
    _item = item;
    
    self.textLabel.text = item.title;

}

@end
