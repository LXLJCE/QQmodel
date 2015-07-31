//
//  SideCell.h
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SideItem;
@interface SideCell : UITableViewCell

@property(nonatomic,strong) SideItem *item;
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

@end
