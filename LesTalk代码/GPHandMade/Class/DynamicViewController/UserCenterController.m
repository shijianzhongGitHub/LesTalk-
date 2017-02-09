//
//  UserCenterController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/2.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "UserCenterController.h"

#import "MyNavigationView.h"

@interface UserCenterController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * userCenterTable;
}

@end

@implementation UserCenterController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUserCenterUI];
    
}

- (void)setupUserCenterUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@" " andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:@"" andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(screeningNavigationClick:) andClass:self];
    [self.view addSubview:navView];
//    navView.alpha = 0.5;
    
    userCenterTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-44)];
    userCenterTable.dataSource = self;
    userCenterTable.delegate = self;
    [self.view addSubview:userCenterTable];
    
    UIView * btnBackView = [[UIView alloc] init];
    btnBackView.frame = CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44);
    btnBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnBackView];
    
    NSArray * btnTitles = @[@"聊天",@"送她玫瑰",@"资料"];
    NSArray * btnImages = @[@"",@"",@""];
    
    for (int i = 0; i<3; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(SCREEN_WIDTH/3*i, 0, SCREEN_WIDTH/3, 44);
        [btn setTitle:[btnTitles objectAtIndex:i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[btnImages objectAtIndex:i]] forState:UIControlStateNormal];
        [btnBackView addSubview:btn];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake((SCREEN_WIDTH/3-0.5)*i, 16, 0.5, 12);
        lineView.backgroundColor = [UIColor grayColor];
        [btnBackView addSubview:lineView];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * userCenterCell = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:userCenterCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userCenterCell];
    }
    
    return cell;
}

- (void)screeningNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
