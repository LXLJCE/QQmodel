//
//  SideGroupItem.h
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SideGroupItem : NSObject
@property(nonatomic,strong) NSArray *items;
@property(nonatomic,weak) UIImage *image;
@property(nonatomic,copy) NSString *sign;
+ (instancetype)groupWithItems:(NSArray *)items;



// 借用模型  用在了friend中
@property(nonatomic,strong) UIView *headerView;
@end
