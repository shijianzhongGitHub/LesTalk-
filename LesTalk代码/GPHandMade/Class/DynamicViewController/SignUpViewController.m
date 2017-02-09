//
//  SignUpViewController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/2.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignUpCell.h"

@interface SignUpViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * sigUpTableView;
}

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSignUpUI];
    
    // Do any additional setup after loading the view.
}

- (void)setupSignUpUI
{
    sigUpTableView = [[UITableView alloc] init];
    sigUpTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    sigUpTableView.delegate = self;
    sigUpTableView.dataSource = self;
    [self.view addSubview:sigUpTableView];
    
    UIButton * backBtn = [[UIButton alloc] init];
    backBtn.frame = CGRectMake(10, 40, 40, 40);
    [backBtn setImage:[UIImage imageNamed:@"返回2"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * signUpSectionView = [[UIView alloc] init];
    signUpSectionView.backgroundColor = [UIColor redColor];
    
    return signUpSectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    
    SignUpCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[SignUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void)backBtnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
