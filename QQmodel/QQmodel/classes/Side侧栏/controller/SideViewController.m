//
//  SideViewController.m
//  QQmodel
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "SideViewController.h"
#import "SideItem.h"
#import "SideGroupItem.h"


#import "SideCell.h"
@interface SideViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIImageView *Bgview;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *sign;
@property (nonatomic,strong) NSMutableArray *groups;
@end

@implementation SideViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
  
    
}

- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
    
}

- (void)setUp
{
    
    SideItem *item0 = [SideItem sideItemWithTitle:@"开通会员" andImage:nil];
    item0.vc = [UIViewController class];
    
    SideItem *item1 = [SideItem sideItemWithTitle:@"QQ钱包" andImage:nil];
     item1.vc = [UIViewController class];
    
    SideItem *item2 = [SideItem sideItemWithTitle:@"网上营业" andImage:nil];
     item2.vc = [UIViewController class];
    
    SideItem *item3 = [SideItem sideItemWithTitle:@"个性装扮" andImage:nil];
     item3.vc = [UIViewController class];
    
    SideItem *item4 = [SideItem sideItemWithTitle:@"我的收藏" andImage:nil];
     item4.vc = [UIViewController class];
    
    SideItem *item5 = [SideItem sideItemWithTitle:@"我的相册" andImage:nil];
     item5.vc = [UIViewController class];
    
    SideItem *item6 = [SideItem sideItemWithTitle:@"我的文件" andImage:nil];
     item6.vc = [UIViewController class];

    SideGroupItem *group = [SideGroupItem groupWithItems:@[item0,item1,item2,item3,item4,item5,item6]];
    group.image = [UIImage imageWithCircleBorderWH:2 borderColor:[UIColor whiteColor] image:[UIImage imageNamed:@"8"]];
    group.sign = @"最美的美女";
    self.image.image = group.image;
    self.sign.text = group.sign;
    [self.groups addObject:group];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SideGroupItem *group = self.groups[section];
    
    
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SideCell *cell = [SideCell cellWithTableView:tableView style:UITableViewCellStyleDefault];
    SideGroupItem *group = self.groups[indexPath.section];
    
    SideItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideGroupItem *group = self.groups[indexPath.section];
    
    SideItem *item = group.items[indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(didSideView:)]) {
        [self.delegate didSideView:item];
    }
    
    
}


@end
