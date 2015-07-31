//
//  SideGroupItem.m
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "SideGroupItem.h"

@implementation SideGroupItem

+ (instancetype)groupWithItems:(NSArray *)items
{
    SideGroupItem *group = [[self alloc]init];
    
    group.items = items;
    
    return group;
    
}
@end
