//
//  LesTalkVipController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "LesTalkVipController.h"
#import "MyNavigationView.h"

@interface LesTalkVipController ()
{
    MyNavigationView * navView;
}

@end

@implementation LesTalkVipController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupLesTalkUI];

}

- (void)setupLesTalkUI
{
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"Les Talk会员" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(LesTalkVipNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIView * topBackView = [[UIView alloc] init];
    topBackView.backgroundColor = [UIColor whiteColor];
    topBackView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 85);
    [self.view addSubview:topBackView];
    
    UIView * redLine = [[UIView alloc] init];
    redLine.frame = CGRectMake(45, topBackView.height/2+2.5, SCREEN_WIDTH-90, 0.5);
    redLine.backgroundColor = [UIColor redColor];
    [topBackView addSubview:redLine];
    
    NSArray * titles = @[@"首次购买",@"三个月",@"六个月",@"一年",@"两年"];
    NSArray * vipTitles = @[@"非VIP",@"VIP1",@"VIP2",@"VIP3",@"VIP4",@"VIP5"];
    
    for (int i=0; i<5; i++)
    {
        UILabel * titlesLabel = [[UILabel alloc] init];
        titlesLabel.frame = CGRectMake(45+((topBackView.width-6*6-60)/5)*i, topBackView.height/4, (SCREEN_WIDTH-90-36)/5+10, 12);
        titlesLabel.font = [UIFont systemFontOfSize:10];
        titlesLabel.text = [NSString stringWithFormat:@"%@",[titles objectAtIndex:i]];
        titlesLabel.textAlignment = NSTextAlignmentCenter;
        titlesLabel.textColor = [UIColor grayColor];
        [topBackView addSubview:titlesLabel];
    }
    
    for (int i=0; i<6; i++)
    {
        UIView * redView = [[UIView alloc] init];
        redView.frame = CGRectMake(45+((topBackView.width-6*6-60)/5)*i, topBackView.height/2, 6, 6);
        redView.layer.cornerRadius = 3;
        redView.backgroundColor = [UIColor redColor];
        [topBackView addSubview:redView];
    }
    
    for (int i=0; i<6; i++)
    {
        UILabel * vipLabels = [[UILabel alloc] init];
        vipLabels.frame = CGRectMake(30+((topBackView.width-6*6-5)/6)*i, (topBackView.height/4)*3-6, (SCREEN_WIDTH-150)/7+5, 12);
        vipLabels.font = [UIFont systemFontOfSize:10];
        vipLabels.text = [NSString stringWithFormat:@"%@",[vipTitles objectAtIndex:i]];
        vipLabels.textAlignment = NSTextAlignmentCenter;
        [topBackView addSubview:vipLabels];
    }
    
    UIView * centerBackView = [[UIView alloc] init];
    centerBackView.backgroundColor = [UIColor whiteColor];
    centerBackView.frame = CGRectMake(0, 64+10+85, SCREEN_WIDTH, 215);
    [self.view addSubview:centerBackView];
    
    //竖线
    UIView * verticalLine = [[UIView alloc] init];
    verticalLine.frame = CGRectMake(centerBackView.width/2, 0, 0.5, centerBackView.height);
    verticalLine.backgroundColor = AppBackgroupColor;
    [centerBackView addSubview:verticalLine];
    
    //横线
    UIView * horizontalLine = [[UIView alloc] init];
    horizontalLine.frame = CGRectMake(0, centerBackView.height/2-1, centerBackView.width, 0.5);
    horizontalLine.backgroundColor = AppBackgroupColor;
    [centerBackView addSubview:horizontalLine];
    
    NSArray * placeHolders = @[@"VIP",@"赠送活跃度",@"每日登录",@"平均每月"];
    NSArray * prices = @[@"29",@"76",@"118",@"142"];//价格
    NSArray * active = @[@"29",@"76",@"118",@"142"];//活跃度
    NSArray * numbers = @[@"3",@"6",@"9",@"15"];//次数
    NSArray * averagePrices = @[@"29",@"25",@"19",@"12"];//均价
    
    for (int i=0; i<4; i++)
    {
        UIView * subViews = [[UIView alloc] init];
        if (i>=2)
        {
            subViews.frame = CGRectMake(5+(centerBackView.width/2)*(i-2), 5+centerBackView.height/2, centerBackView.width/2-10, centerBackView.height/2-10);
        }
        else
        {
            subViews.frame = CGRectMake(5+(centerBackView.width/2)*i, 5, centerBackView.width/2-10, centerBackView.height/2-10);
        }
        subViews.backgroundColor = [UIColor whiteColor];
        [centerBackView addSubview:subViews];
        
        for (int j=0; j<4; j++)
        {
            UILabel * placeHolderLabel = [[UILabel alloc] init];
            placeHolderLabel.frame = CGRectMake(10, 5+(20+5)*j, 60, 16);
            placeHolderLabel.text = [NSString stringWithFormat:@"%@",[placeHolders objectAtIndex:j]];
            placeHolderLabel.textColor = [UIColor grayColor];
            placeHolderLabel.font = [UIFont systemFontOfSize:10];
            [subViews addSubview:placeHolderLabel];
            
            UILabel * titlesLabel = [[UILabel alloc] init];
            titlesLabel.frame = CGRectMake(80, 5+(20+5)*j, 30, 16);
            titlesLabel.textColor = [UIColor blackColor];
            titlesLabel.text = [NSString stringWithFormat:@"%@",[prices objectAtIndex:j]];
            titlesLabel.font = [UIFont systemFontOfSize:10];
            [subViews addSubview:titlesLabel];
            
            UIButton * openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            if (j>=2)
            {
                openBtn.frame = CGRectMake(topBackView.width/2-60+(60+topBackView.width/2-65)*(j-2), 15+100, 40, 15);
            }
            else
            {
                openBtn.frame = CGRectMake(topBackView.width/2-60+(60+topBackView.width/2-64)*j, 10, 40, 15);
            }
            openBtn.layer.cornerRadius = 8;
            [openBtn setTitle:@"开通" forState:UIControlStateNormal];
            openBtn.backgroundColor = [UIColor redColor];
            openBtn.titleLabel.font = [UIFont boldSystemFontOfSize:10];
            [openBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [subViews addSubview:openBtn];
        }
    }
    
    UIView * bottomBackView = [[UIView alloc] init];
    bottomBackView.backgroundColor = [UIColor whiteColor];
    bottomBackView.frame = CGRectMake(0, 64+15+85+215+5, SCREEN_WIDTH, SCREEN_HEIGHT-centerBackView.y+10+centerBackView.height);
    [self.view addSubview:bottomBackView];
    
    UILabel * vipLabel = [[UILabel alloc] init];
    vipLabel.frame = CGRectMake(0, 10, 90, 14);
    vipLabel.textColor = [UIColor blackColor];
    vipLabel.text = @"会员特权";
    vipLabel.font = [UIFont systemFontOfSize:14];
    vipLabel.textAlignment = NSTextAlignmentCenter;
    [bottomBackView addSubview:vipLabel];
    
    UIView * bottomViewLine = [[UIView alloc] init];
    bottomViewLine.frame = CGRectMake(10, 35, bottomBackView.width-20, 0.5);
    bottomViewLine.backgroundColor = AppBackgroupColor;
    [bottomBackView addSubview:bottomViewLine];
    
    NSArray * vipImages = @[@"匹配数",@"红人榜",@"群增多",@"动态优先",@"线下待遇"];
    NSArray * vipTitleStrings = @[@"匹配人数增加",@"红人榜优先推荐",@"创建群数增加",@"动态优先展示",@"线下活动VIP待遇"];
    for (int i=0; i<5; i++)
    {
        UILabel * vipTitleLabel = [[UILabel alloc] init];
        vipTitleLabel.textAlignment = NSTextAlignmentLeft;
        vipTitleLabel.textColor = [UIColor blackColor];
        vipTitleLabel.font = [UIFont systemFontOfSize:12];
        vipTitleLabel.text = [NSString stringWithFormat:@"%@",[vipTitleStrings objectAtIndex:i]];
        [bottomBackView addSubview:vipTitleLabel];
        
        UIImageView * vipImageViews = [[UIImageView alloc] init];
        
        if (i>=2 && i<4)
        {
            vipImageViews.frame = CGRectMake(15+(bottomBackView.width/2-10)*(i-2), 92, 30, 30);
            vipTitleLabel.frame = CGRectMake(55+(bottomBackView.width/2-10)*(i-2), 92, 100, 30);
        }
        else if(i==4)
        {
            vipImageViews.frame = CGRectMake(15+(10+bottomBackView.width/2-10)*(i-4), 140, 30, 30);
            vipTitleLabel.frame = CGRectMake(55+(bottomBackView.width/2-10)*(i-4), 140, 100, 30);
        }
        else
        {
            vipImageViews.frame = CGRectMake(15+(bottomBackView.width/2-10)*i, 40, 30, 30);
            vipTitleLabel.frame = CGRectMake(55+(bottomBackView.width/2-10)*i, 40, 100, 30);
        }
        vipImageViews.layer.cornerRadius = 15;
        vipImageViews.layer.masksToBounds = YES;
        [vipImageViews setImage:[UIImage imageNamed:[vipImages objectAtIndex:i]]];
        [bottomBackView addSubview:vipImageViews];
    }
}

- (void)LesTalkVipNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
