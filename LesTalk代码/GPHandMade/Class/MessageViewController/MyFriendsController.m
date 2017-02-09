//
//  MyFriendsController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/8.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "MyFriendsController.h"
#import "MyNavigationView.h"
#import "MyFriendsCell.h"

@interface MyFriendsController ()<UITableViewDataSource,UITableViewDelegate>
{
    MyNavigationView * navView;
    UITableView      * reciveTable;
}

@end

@implementation MyFriendsController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupReceiveUI];
}

- (void)setupReceiveUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"我的好友" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(myFriendsNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    //    searchBar.barTintColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    searchBar.placeholder = @"输入他的昵称";
    [self.view addSubview:searchBar];
    
    reciveTable = [[UITableView alloc] init];
    reciveTable.frame = CGRectMake(0, 64+50, SCREEN_WIDTH, SCREEN_HEIGHT-64-50);
    reciveTable.dataSource = self;
    reciveTable.delegate = self;
    [self.view addSubview:reciveTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    
    MyFriendsCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[MyFriendsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void)myFriendsNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
