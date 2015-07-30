//
//  UIView+frame.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/29.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;

}
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
    
}
- (CGFloat)width
{

    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;

}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;

}
@end
