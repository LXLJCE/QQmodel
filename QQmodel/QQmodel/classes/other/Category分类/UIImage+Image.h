//
//  UIImage+Image.h
//  01-图片裁剪
//
//  Created by apple on 15/7/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//  圆形裁剪

#import <UIKit/UIKit.h>

@interface UIImage (Image)


/**
 *  圆形裁剪
 *
 *  @param borderWH    圆环宽度
 *  @param borderColor 圆环颜色
 *  @param image       需要裁剪的图片
 *
 *  @return 裁剪好的图片
 */
+ (UIImage *)imageWithCircleBorderWH:(CGFloat)borderWH borderColor:(UIColor *)borderColor image:(UIImage *)image;

@end
