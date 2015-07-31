//
//  SideItem.m
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "SideItem.h"

@implementation SideItem

+ (instancetype)sideItemWithTitle:(NSString *)title andImage:(UIImage *)image
{
    SideItem *item = [[self alloc]init];
    
    item.title = title;
    item.image = image;
    return item;

}
@end
