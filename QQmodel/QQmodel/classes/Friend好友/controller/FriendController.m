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
@property(nonatomic,strong) SideGroupItem *group;
@end

@implementation FriendController

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
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.rowHeight = 44;

}
- (void)setUp0
{
    

    SideItem *item0 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item1 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item2 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item3 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    SideItem *item4 = [SideItem sideItemWithTitle:@"abc" andImage:nil];
    
    SideGroupItem *group = [SideGroupItem groupWithItems:@[item0,item1,item2,item3,item4]];
    
    
    self.group = group;
    
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSLog(@"%s",__func__);

  
    SideGroupItem *group = self.groups[section];
        return group.headerView;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    SideGroupItem *group = self.groups[indexPath.section];
    SideItem *item = group.items[indexPath.row];
    
    NSLog(@"%d",group.items.count);
    
    
    if (indexPath.row == 0 && group.items.count == 1) {
        
        [self.groups removeObject:group];
        
        [self.groups insertObject:self.group atIndex:indexPath.section];
        
        NSLog(@"%@",self.group);
        
        [self.tableView reloadData];
        
        
    }
    

    
    else if (indexPath.row == 0) {
        
        SideGroupItem *newGroup = [SideGroupItem groupWithItems:@[item]];
        [self.groups removeObject:group];
        NSLog(@"%zd",indexPath.section);
        [self.groups insertObject:newGroup atIndex:indexPath.section];
        [self.tableView reloadData];
        
    }
    
    

}
@end