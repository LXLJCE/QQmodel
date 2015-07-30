//
//  RootViewController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/29.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "RootViewController.h"
#import "LoginController.h"
#import "GuideController.h"
@implementation RootViewController

+ (id)rootViewController
{
    NSString *lastVision = [[NSUserDefaults standardUserDefaults] objectForKey:@"vision"];
    
    NSString *curVision = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    if ([lastVision isEqualToString:curVision]) {
        
        LoginController *logVc = [[LoginController alloc]init];
        logVc.view.backgroundColor = [UIColor redColor];
        
        return logVc;
    
    }else{
    
        GuideController *guideVc = [[GuideController alloc]init];
        
        [[NSUserDefaults standardUserDefaults] setObject:curVision forKey:@"vision"];
        return guideVc;
    }
    

}

@end
