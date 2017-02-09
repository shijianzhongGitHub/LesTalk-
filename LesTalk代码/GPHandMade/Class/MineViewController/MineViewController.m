//
//  MineViewController.m
//  LesTalk
//
//  Created by 史建忠 on 2016/10/27.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "MineViewController.h"
#import "MyNavigationView.h"
#import "PersonalInformationController.h"
#import "OnLineServiceController.h"
#import "UserCertificationController.h"
#import "LesTalkVipController.h"
#import "MyMatchingController.h"
#import "MyActiveController.h"
#import "SystemSettingsController.h"


@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * mainTableView;
}

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"个人中心" andLeftBBIImage:[UIImage imageNamed:@""] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(MeNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    mainTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-76) style:UITableViewStyleGrouped];
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 80;
    }
    
    if (indexPath.row>=4&&indexPath.row<=5)
    {
        return 70;
    }
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    if (indexPath.row >= 1 && indexPath.row <= 7)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row == 0)
    {
        UIView * topView = [[UIView alloc] init];
        topView.frame = CGRectMake(0, -35, SCREEN_WIDTH, 100);
        topView.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:topView];
        cell.contentView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        
        UIImageView * userImageView = [[UIImageView alloc] init];
        userImageView.frame = CGRectMake(25, -15, 50, 50);
        userImageView.layer.cornerRadius = 25;
        userImageView.layer.masksToBounds = YES;
        [userImageView setImage:[UIImage imageNamed:@"头像女"]];
        [cell.contentView addSubview:userImageView];
        
        UILabel * nickLabel = [[UILabel alloc] init];
        nickLabel.frame = CGRectMake(90, 5, 100, 20);
        nickLabel.text = @"图咯咯";
        nickLabel.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:nickLabel];
        
        UIImageView * vipImg = [[UIImageView alloc] init];
        vipImg.frame = CGRectMake(100+40, 8, 14, 14);
        [vipImg setImage:[UIImage imageNamed:@"vip_selected"]];
        [cell.contentView addSubview:vipImg];
        
        UIImageView * levelImg = [[UIImageView alloc] init];
        levelImg.frame = CGRectMake(75+90, 10, 15, 9);
        levelImg.image = [UIImage imageNamed:@"lv1"];
        [cell.contentView addSubview:levelImg];
        
        UIButton * exitBtn = [[UIButton alloc] init];
        exitBtn.frame = CGRectMake(SCREEN_WIDTH-110, 0, 90, 30);
        exitBtn.layer.cornerRadius  = 15;
        [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [exitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        exitBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        exitBtn.backgroundColor = [UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0];
        [cell.contentView addSubview:exitBtn];
    }

    UIView * cellLineView = [[UIView alloc] init];
    cellLineView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
    [cell.contentView addSubview:cellLineView];
    
    if (indexPath.row == 1)
    {
        cell.textLabel.text = @"个人资料";
        cell.imageView.image = [UIImage imageNamed:@"personalData"];
        cellLineView.frame = CGRectMake(0, 59.5, SCREEN_WIDTH, 0.5);
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"用户认证";
        cell.imageView.image = [UIImage imageNamed:@"certification"];
        cellLineView.frame = CGRectMake(0, 59.5, SCREEN_WIDTH, 0.5);
    }
    else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"我的匹配";
        cell.imageView.image = [UIImage imageNamed:@"matching"];
        cellLineView.frame = CGRectMake(0, 60, SCREEN_WIDTH, 10);
    }
    else if (indexPath.row == 4)
    {
        cell.textLabel.text = @"LesTalk会员";
        cell.imageView.image = [UIImage imageNamed:@"vip"];
        cellLineView.frame = CGRectMake(0, 59.5, SCREEN_WIDTH, 0.5);
    }
    else if (indexPath.row == 5)
    {
        cell.textLabel.text = @"我的活跃度";
        cell.imageView.image = [UIImage imageNamed:@"active"];
        cellLineView.frame = CGRectMake(0, 59.5, SCREEN_WIDTH, 0.5);
    }
    else if (indexPath.row == 6)
    {
        cell.textLabel.text = @"系统设置";
        cell.imageView.image = [UIImage imageNamed:@"setting"];
        cellLineView.frame = CGRectMake(0, 59.5, SCREEN_WIDTH, 0.5);
    }
    else if (indexPath.row == 7)
    {
        cell.textLabel.text = @"在线客服";
        cell.imageView.image = [UIImage imageNamed:@"help"];
        cellLineView.frame = CGRectMake(0, 59.5, SCREEN_WIDTH, 0.5);
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        PersonalInformationController * personalVc = [[PersonalInformationController alloc] init];
        personalVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:personalVc animated:YES];
    }
    else if (indexPath.row == 2)
    {
        UserCertificationController * userCertificatioinVc = [[UserCertificationController alloc] init];
        userCertificatioinVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:userCertificatioinVc animated:YES];
    }
    else if (indexPath.row == 3)
    {
        MyMatchingController * myMatchingVc = [[MyMatchingController alloc] init];
        myMatchingVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myMatchingVc animated:YES];
    }
    else if (indexPath.row == 4)
    {
        LesTalkVipController * LesTalkVipVc = [[LesTalkVipController alloc] init];
        LesTalkVipVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:LesTalkVipVc animated:YES];
    }
    else if (indexPath.row == 5)
    {
        MyActiveController * myActiveVc = [[MyActiveController alloc] init];
        myActiveVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myActiveVc animated:YES];
    }
    else if (indexPath.row == 6)
    {
        SystemSettingsController * systemSettingsVc = [[SystemSettingsController alloc] init];
        systemSettingsVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:systemSettingsVc animated:YES];
    }
    else if (indexPath.row == 7)
    {
        OnLineServiceController * onLineVc = [[OnLineServiceController alloc] init];
        onLineVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:onLineVc animated:YES];
    }
}

- (void)MeNavigationClick:(UIButton *)btn
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
