//
//  FriendController.m
//  QQdamol
//
//  Created by 刘嘉欣 on 15/7/30.
//  Copyright (c) 2015年 刘嘉欣. All rights reserved.
//

#import "FriendController.h"
#import "SideItem.h"
#import "SideGroupItem.h"
#import "SideCell.h"
@interface FriendController ()
@property(nonatomic,strong) NSMutableArray *groups;
@property(nonatomic,strong) NSMutableArray *flagArray;
@end

@implementation FriendController

-  (NSMutableArray *)flagArray
{
    if (!_flagArray) {
        _flagArray = [NSMutableArray array];
    }
    return _flagArray;

}

- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp0];
    [self setUp1];
    // 用于隐藏导航条颜色。
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
  
    
    for (int i = 0; i < self.groups.count; i++) {
        [self.flagArray addObject:@1];
    }

}


- (void)setUp0
{
    

    SideItem *item0 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item1 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item2 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item3 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item4 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    
    SideGroupItem *group = [SideGroupItem groupWithItems:@[item0,item1,item2,item3,item4]];
    
    [self.groups addObject:group];

}
- (void)setUp1
{
    
    
    SideItem *item0 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item1 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item2 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item3 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item4 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    
    SideGroupItem *group = [SideGroupItem groupWithItems:@[item0,item1,item2,item3,item4]];
    
    group.headerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"8"]];
   
    
    
    [self.groups addObject:group];
    
}
- (int)numberCountOfSection:(NSInteger)section
{
    int num = [[self.flagArray objectAtIndex:section] intValue];
    if (num == 1) {
        return 0;
    }else
    {
        SideGroupItem *group = self.groups[section];
        return group.items.count;
    
    }
    
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.groups.count;
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self numberCountOfSection:section];
   

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    SideCell *cell = [SideCell cellWithTableView:tableView style:UITableViewCellStyleDefault];
    SideGroupItem *group = self.groups[indexPath.section];
    SideItem *item = group.items[indexPath.row];
    cell.item = item;
    return cell;


}
//段头返回一个view，添加点击按钮
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSLog(@"%zd",section);
    UIView *headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 35)];
    headerView.backgroundColor=[UIColor clearColor];
    headerView.alpha=0.9;
//    [headerView setTag:[[NSString stringWithFormat:@"%ld1",(long)section] intValue]];
    //底图
//    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 35)];
//    img.image=[UIImage imageNamed:@"header.png"];
//    [img setTag:[[NSString stringWithFormat:@"%ld2",(long)section] intValue]];
//    img.backgroundColor=[UIColor clearColor];
    //按钮
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 375, 35)];
//    [btn setBackgroundColor:[UIColor clearColor]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:[[NSString stringWithFormat:@"%ld",(long)section] intValue]];
//    NSLog(@"%zd",btn.tag);
    
    //上下的标志图片
    UIImageView *UDImg=[[UIImageView alloc] initWithFrame:CGRectMake(10,10, 20, 20)];
    int flagNum=[[self.flagArray objectAtIndex:section] intValue];
    if (flagNum==1) {
        UDImg.image=[UIImage imageNamed:@"list_ico.png"];
    }else {
        UDImg.image=[UIImage imageNamed:@"list_ico_d.png"];
    }
//    [UDImg setTag:[[NSString stringWithFormat:@"%ld3",(long)section] intValue]];
//    UDImg.backgroundColor=[UIColor clearColor];
    
//    [headerView addSubview:img];
    [headerView addSubview:btn];
    [headerView addSubview:UDImg];
    
    return headerView;
    
    
    
}
//段头按钮点击响应事件
-(void)btnClick:(id)sender{
    UIButton *btn=(UIButton *)sender;
    int tag=(int)btn.tag;
    int flagNum=[[self.flagArray objectAtIndex:tag] intValue];
    NSLog(@"%zd",flagNum);
    
    if (flagNum==1) {
        [self.flagArray replaceObjectAtIndex:tag withObject:@0];
    }else {
        [self.flagArray replaceObjectAtIndex:tag withObject:@1];
    }
    
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
@end