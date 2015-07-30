//
//  NavigationController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

+ (void)initialize
{

  UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    bar.tintColor = [UIColor whiteColor];
    
    NSDictionary *arrTitle = @{@"NSForegroundColorAttributeName": [UIColor whiteColor] , @"NSFontAttributeName":[UIFont systemFontOfSize:17]};
    
    
    bar.titleTextAttributes = arrTitle;

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
