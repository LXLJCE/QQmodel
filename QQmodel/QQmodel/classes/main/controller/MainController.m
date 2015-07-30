//
//  MainController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "MainController.h"
#import "TabBarController.h"
#import "SideController.h"
@interface MainController ()
@property(nonatomic,strong) TabBarController *tabVc;
@property(nonatomic,strong) SideController *sideVc;

@end

@implementation MainController
#define MaxX 250
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
}
- (void)setUp
{
    
    SideController *sideVc = [[SideController alloc]initWithStyle:UITableViewStylePlain];
    self.sideVc = sideVc;
    [self.view addSubview:sideVc.view];
    
    
    TabBarController *tabVc = [[TabBarController alloc]init];
    self.tabVc = tabVc;
    [self.view addSubview:tabVc.view];
    
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.tabVc.view addGestureRecognizer:pan];

}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint panP = [pan translationInView:self.tabVc.view];
    
    CGFloat offsetX = panP.x;
    if (panP.x > 0 || self.tabVc.view.x > 0) {
        self.tabVc.view.frame = [self newViewFrame:offsetX];
    }
    
    
    [pan setTranslation:CGPointZero inView:self.tabVc.view];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        
        if (self.tabVc.view.x < ScreenBounds.size.width * 0.5){
            
            offsetX = -self.tabVc.view.x ;
            
            
        }else{
            offsetX = MaxX - self.tabVc.view.x;
            
            
        }
        [UIView animateWithDuration:0.1 animations:^{
            self.tabVc.view.frame = [self newViewFrame:offsetX];
        }];
        }
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tabVc.view.frame = [self newViewFrame:-ScreenBounds.size.width];
        
    }];
    
}

- (CGRect)newViewFrame:(CGFloat)offsetX
{
    
    CGFloat X  = self.tabVc.view.x + offsetX;
    
    if (X < 0) {
        X = 0;
    }
    CGFloat Y  = X * 100/375.0;
    CGFloat H  = ScreenBounds.size.height - 2 * Y;
    CGFloat W  = ScreenBounds.size.width * (H / ScreenBounds.size.height);
    return CGRectMake(X, Y, W, H);
    
    
}
@end
