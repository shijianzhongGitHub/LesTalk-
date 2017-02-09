//
//  SystemSettingsController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/5.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "SystemSettingsController.h"
#import "MyNavigationView.h"
#import "AccountController.h"

@interface SystemSettingsController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView * systemSettingsTable;
}

@end

@implementation SystemSettingsController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSystemSettingsUI];
}

- (void)setupSystemSettingsUI
{
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"系统设置" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(systemSettingsNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    systemSettingsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    systemSettingsTable.delegate = self;
    systemSettingsTable.dataSource = self;
    [self.view addSubview:systemSettingsTable];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else if (section == 1)
    {
        return 2;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0)
    {
        UISwitch * cellSwitch = [[UISwitch alloc]init];
        cellSwitch.frame = CGRectMake(SCREEN_WIDTH - 60, 7, 0, 0);
        [cell.contentView addSubview:cellSwitch];
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"新消息声音";
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel.text = @"新消息震动";
        }
        else if(indexPath.row == 2)
        {
            cell.textLabel.text = @"接受陌生人消息";
        }
    }
    else if (indexPath.section == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"聊天背景";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"账户设置";
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        if (indexPath.row == 1)
        {
            AccountController * accountVc = [[AccountController alloc] init];
            [self.navigationController pushViewController:accountVc animated:YES];
        }
    }
}

- (void)systemSettingsNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
