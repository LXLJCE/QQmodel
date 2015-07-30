//
//  GuideController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/29.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "GuideController.h"

@interface GuideController ()

@end

@implementation GuideController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [self initWithCollectionViewLayout:flow];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
@end