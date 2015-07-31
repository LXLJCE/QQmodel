//
//  MainController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "MainController.h"
#import "TabBarController.h"
#import "SideViewController.h"
#import "SideItem.h"
@interface MainController ()<SideViewControllerDelegate,NavigationControllerDelegate>
@property(nonatomic,strong) TabBarController *tabVc;
@property(nonatomic,strong) SideViewController *sideVc;
@property( nonatomic,strong) UIViewController *selectVc;

@end

@implementation MainController
#define MaxX 300
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
}
- (void)setUp
{
    SideViewController *sideVc = [[SideViewController alloc]init];
    self.sideVc = sideVc;
    sideVc.delegate = self;
    [self.view addSubview:sideVc.view];
    
    
    TabBarController *tabVc = [[TabBarController alloc]init];

    self.tabVc = tabVc;
    tabVc.naVc.PopDelegate = self;
    [self.view addSubview:tabVc.view];
    
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.tabVc.view addGestureRecognizer:pan];
    

}



- (void)pan:(UIPanGestureRecognizer *)pan
{

    
    CGPoint panP = [pan translationInView:self.tabVc.view];
    
    CGFloat offsetX = panP.x;
    if (panP.x > 0 || self.tabVc.view.x > 0 ) {
        
        
        self.tabVc.view.frame = [self newViewFrame:offsetX];
        
        
    }
    
    
    [pan setTranslation:CGPointZero inView:self.tabVc.view];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        
        if (self.tabVc.view.x < ScreenBounds.size.width * 0.5){
            
            offsetX = -self.tabVc.view.x ;
            
            
        }else{
            offsetX = MaxX - self.tabVc.view.x;
            
            if (self.tabVc.naVc.childViewControllers.count == 1) {
                UIViewController *vc = self.tabVc.naVc.childViewControllers[0];
                vc.view.userInteractionEnabled = NO;
            }
           
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
#pragma mark -- SideViewControllerDelegate

- (void)didSideView:(SideItem *)item
{
    
    [self.selectVc removeFromParentViewController];
  [UIView animateWithDuration:0.25 animations:^{
        self.tabVc.view.frame = [self newViewFrame:-ScreenBounds.size.width];
        
    }];
    UIViewController *Vc = [[item.vc alloc]init];
    Vc.view.backgroundColor = [UIColor redColor];
    
    Vc.navigationItem.title = item.title;
    _selectVc = Vc;
    self.tabVc.selectedIndex = 0;
    [self.tabVc.naVc pushViewController:Vc animated:YES];

}

#pragma mark - NavigationControllDelegate
- (void)didClickBack
{


    self.tabVc.view.frame = [self newViewFrame:MaxX];


}

@end
