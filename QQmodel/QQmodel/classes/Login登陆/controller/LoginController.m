//
//  LoginController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/29.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "LoginController.h"
#import "MainController.h"
@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)login {
    
    KeyWindow.rootViewController = [[MainController alloc]init];
    
}

@end
