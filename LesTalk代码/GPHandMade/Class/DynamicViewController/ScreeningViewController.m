//
//  ScreeningViewController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/10/31.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "ScreeningViewController.h"
#import "MyNavigationView.h"

@interface ScreeningViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * screeningTableView;
    NSArray          * titleArray;
}

@end

@implementation ScreeningViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupScreeningUI];
    
    // Do any additional setup after loading the view.
}

- (void)setupScreeningUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"筛选" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:@"" andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(searchNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    titleArray = @[@"开启帅选",@"是否在线",@"是否认证",@"是否单身",@"角色",@"年龄"];
    
    screeningTableView = [[UITableView alloc] init];
    screeningTableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    screeningTableView.delegate = self;
    screeningTableView.dataSource = self;
    screeningTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:screeningTableView];
    
    UIButton * completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    completeBtn.frame =  CGRectMake(10, 44*9, SCREEN_WIDTH-20, 50);
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    completeBtn.layer.cornerRadius = 5;
    [completeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [completeBtn setBackgroundColor:[UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0]];
    [screeningTableView addSubview:completeBtn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * searchCellId = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:searchCellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellId];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    UIView * cellLine = [[UIView alloc] init];
    cellLine.frame = CGRectMake(0, 43.5, SCREEN_WIDTH, 0.5);
    cellLine.backgroundColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:0.8];
    [cell.contentView addSubview:cellLine];
    
    if (indexPath.row >=0 && indexPath.row <= 3)
    {
        UISwitch * cellSwitch = [[UISwitch alloc] init];
        cellSwitch.frame = CGRectMake(SCREEN_WIDTH-65, 6, 0, 0);
        [cell.contentView addSubview:cellSwitch];
    }
    
    NSArray * roleImageArray = @[@"T红",@"P红",@"H红"];
    
    if (indexPath.row == 4)
    {
        for (int i = 0; i < 3; i++)
        {
            //角色按钮
            UIButton * roleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            roleBtn.frame = CGRectMake((SCREEN_WIDTH/5*(i+1))+10, 8, SCREEN_WIDTH/6, 30);
//            roleBtn.backgroundColor = [UIColor redColor];
            [roleBtn setBackgroundImage:[UIImage imageNamed:[roleImageArray objectAtIndex:i]] forState:UIControlStateNormal];
            [cell.contentView addSubview:roleBtn];
        }
    }
    
    if (indexPath.row == 5)
    {
        UILabel * ageLabel = [[UILabel alloc] init];
        ageLabel.frame = CGRectMake(80, 8, SCREEN_WIDTH-150, 30);
        ageLabel.text = @"15-20";
        ageLabel.textColor = [UIColor grayColor];
        [cell.contentView addSubview:ageLabel];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[titleArray objectAtIndex:indexPath.row]];    
    
    return cell;
    
}

- (void)searchNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
