//
//  SideViewController.h
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SideItem;
@protocol SideViewControllerDelegate<NSObject>

@optional

- (void)didSideView:(SideItem *)item;

@end


@interface SideViewController : UIViewController


@property(nonatomic,weak) id<SideViewControllerDelegate> delegate;
@end
