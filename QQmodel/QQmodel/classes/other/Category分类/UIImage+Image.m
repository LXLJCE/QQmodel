//
//  UIImage+Image.m
//  01-图片裁剪
//
//  Created by apple on 15/7/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageWithCircleBorderWH:(CGFloat)borderWH borderColor:(UIColor *)borderColor image:(UIImage *)image
{
    
    
    CGFloat rectWH = image.size.width + 2 * borderWH;
    
    CGRect rect = CGRectMake(0, 0, rectWH , rectWH);
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    // 描述大圆的路径绘制上去
    UIBezierPath *bigPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    [borderColor set];
    
    [bigPath fill];
    
    CGFloat imageWH = image.size.width;
    
    // 裁剪区域
    CGRect clipR = CGRectMake(borderWH, borderWH, imageWH, imageWH);
    
    // 描述裁剪圆形路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipR];
    
    // 设置为裁剪区域
    [clipPath addClip];
    
    [image drawInRect:clipR];
    
    // 从上下文的内容中生成一张图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return  image;
}


@end
