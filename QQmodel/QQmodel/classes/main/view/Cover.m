//
//  Cover.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "Cover.h"

@implementation Cover

+ (void)showInRect:(CGRect)rect
{
    UIView *cover = [[self alloc]init];
    cover.frame = rect;
    
    cover.alpha = 0.2;
    [KeyWindow addSubview:cover];
}
@end
