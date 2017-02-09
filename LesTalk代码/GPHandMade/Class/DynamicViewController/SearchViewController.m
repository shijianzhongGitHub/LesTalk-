//
//  SearchViewController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/10/31.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "SearchViewController.h"
#import "MyNavigationView.h"

@interface SearchViewController ()
{
    MyNavigationView * navView;
}

@end

@implementation SearchViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSearchUI];
    
}

- (void)setupSearchUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"搜索" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:@"" andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(screeningNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
//    searchBar.barTintColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    searchBar.placeholder = @"输入他的昵称";
    [self.view addSubview:searchBar];
}

- (void)screeningNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
