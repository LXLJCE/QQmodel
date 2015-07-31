//
//  SideItem.h
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SideItem : NSObject

@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,assign) Class vc;
+ (instancetype)sideItemWithTitle:(NSString *)title andImage:(UIImage *)image;

@end
