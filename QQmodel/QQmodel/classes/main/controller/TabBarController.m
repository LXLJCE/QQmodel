//
//  TabBarController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/29.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "TabBarController.h"
#import "Cover.h"
#import "MessageController.h"
#import "FriendController.h"
#import "DynamicController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
}

- (void)setUp
{
    MessageController *mes = [[MessageController alloc]init];
    [self addChildViewController:mes];
    
    FriendController *fri = [[FriendController alloc]init];
    [self addChildViewController:fri];
    
    DynamicController *dyn = [[DynamicController alloc]init];
    [self addChildViewController:dyn];
    
}





@end
