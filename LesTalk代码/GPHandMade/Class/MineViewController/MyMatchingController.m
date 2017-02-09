//
//  MyMatchingController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "MyMatchingController.h"
#import "MyNavigationView.h"
#import "MyFriendsCell.h"
#import "AFViewShaker.h"

@interface MyMatchingController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * MyMatchingTable;
}

@end

@implementation MyMatchingController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupMyMatchingUI];
}

- (void)setupMyMatchingUI
{
    self.view.backgroundColor = AppBackgroupColor;
    
//    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
//    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"我的匹配" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(MyMatchingNavigationClick:) andClass:self];
//    [self.view addSubview:navView];
    
    MyMatchingTable = [[UITableView alloc] init];
    MyMatchingTable.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    MyMatchingTable.dataSource = self;
    MyMatchingTable.delegate = self;
    [self.view addSubview:MyMatchingTable];
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
    NSString * myMatchingCellId = @"cell";
    
    MyFriendsCell * cell = [tableView dequeueReusableCellWithIdentifier:myMatchingCellId];
    if (cell == nil)
    {
        cell = [[MyFriendsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myMatchingCellId];
    }
    
    if (indexPath.row == 0)
    {
//        cell.roseImg.image = [UIImage imageNamed:@"lesTalk"];
        [cell.roseBtn setImage:[UIImage imageNamed:@"lesTalk"] forState:UIControlStateNormal];
        [cell.roseBtn addTarget:self action:@selector(shakeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)shakeBtnClick:(UIButton *)btn
{
    [[[AFViewShaker alloc] initWithView:btn] shake];
    
    UIImageView * dynamicImage = [[UIImageView alloc] init];
    dynamicImage.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/3-60, 0, 0);
    dynamicImage.image = [UIImage imageNamed:@"lesTalk"];
    [self.view addSubview:dynamicImage];
    
    [UIView animateWithDuration:0.6 animations:^{
        dynamicImage.frame = CGRectMake(SCREEN_WIDTH/2-60, SCREEN_HEIGHT/3-60, 120, 120);
    } completion:^(BOOL finished) {
        dynamicImage.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/3-60, 0, 0);
    }];
}

- (void)MyMatchingNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
