//
//  NavigationController.h
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationControllerDelegate <NSObject>

@optional

- (void)didClickBack;


@end



@interface NavigationController : UINavigationController

@property(nonatomic,weak) id PopDelegate;

@end
