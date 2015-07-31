//
//  NavigationController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "NavigationController.h"
#import <objc/runtime.h>
@interface NavigationController ()

@end

@implementation NavigationController

+ (void)initialize
{

  UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    bar.tintColor = [UIColor whiteColor];
    
    NSDictionary *arrTitle = @{NSForegroundColorAttributeName: [UIColor whiteColor] , NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    
    bar.titleTextAttributes = arrTitle;
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *barItem = [UIBarButtonItem appearanceWhenContainedIn:self,nil];
    [barItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}
- (void)setUp
{

    
    UIScreenEdgePanGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    
    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
//    for (int i= 0; i < count ; i++) {
//        Ivar ivar = ivars[i];
//        NSString *name = @(ivar_getName(ivar));
//        NSLog(@"%@",name);
//    }
    
    NSArray *tagets = [gesture valueForKey:@"_targets"];
    
    id gestureRecongnizer = tagets[0];
    id target = [gestureRecongnizer valueForKey:@"_target"];
    self.interactivePopGestureRecognizer.enabled = NO;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];

}
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)pan
{
    
    // 只有非跟控制器才能拥有滑动返回功能 子控件数为1，因为根控制器也为其子控制器。所以为1时，就是只子控制器。
    return self.childViewControllers.count != 1;
}




@end
