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
#import "NavigationController.h"
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
    
//    NavigationController *naVc = [[NavigationController alloc]initWithRootViewController:mes];
//    
//    self.naVc = naVc;
//    naVc.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
//    naVc.tabBarItem.title = @"消息";
//    naVc.tabBarItem.badgeValue = @"99+";
//    
//    [self addChildViewController:naVc];
    [self setAddOneChileController:mes image:[UIImage imageNamed:@"tab_recent_nor"] title:@"消息" badgeValue:@"99+"];
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tab_me_nor"] style:UIBarButtonItemStyleDone target:self action:nil];
    [mes.navigationItem setLeftBarButtonItem:leftBarItem animated:YES];
    self.naVc = mes.navigationController;
    FriendController *fri = [[FriendController alloc]initWithStyle:UITableViewStyleGrouped];
    [self setAddOneChileController:fri image:[UIImage imageNamed:@"tab_buddy_nor"] title:@"好友" badgeValue:@"1"];
    
    DynamicController *dyn = [[DynamicController alloc]init];
    [self setAddOneChileController:dyn image:[UIImage imageNamed:@"tab_qworld_nor"] title:@"动态" badgeValue:@"2"];
   
   
}

- (void)setAddOneChileController:(UIViewController *)viewController image:(UIImage *)image title:(NSString *)title badgeValue:(NSString *)badgeValue
{

    NavigationController *naVc = [[NavigationController alloc]initWithRootViewController:viewController];
    viewController.navigationItem.title = title;
  
       naVc.tabBarItem.image = image;
    naVc.tabBarItem.title = title;
    naVc.tabBarItem.badgeValue = badgeValue;
    
    [self addChildViewController:naVc];
}

@end
