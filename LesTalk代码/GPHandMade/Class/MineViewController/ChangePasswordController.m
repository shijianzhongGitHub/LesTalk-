//
//  ChangePasswordController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/18.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "ChangePasswordController.h"
#import "MyNavigationView.h"

@interface ChangePasswordController ()
{
    MyNavigationView * navView;
}

@end

@implementation ChangePasswordController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupChangePwdUI];
}

- (void)setupChangePwdUI
{
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"修改密码" andLeftBBIImage:[UIImage imageNamed:@""] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(ChangePwdNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIView * whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 64+10, SCREEN_WIDTH, 180)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    
    NSArray * subTitles = @[@"原密码",@"新密码",@"确定密码"];
    NSArray * placeHolderTexts = @[@"请输入原密码",@"请输入新密码",@"请再次输入新密码"];
    
    for (int i=0; i<3; i++)
    {
        UIView * lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(0, 60*i, SCREEN_WIDTH, 0.5);
        lineView.backgroundColor = AppBackgroupColor;
        [whiteView addSubview:lineView];
        
        UILabel * subTitlesLabel = [[UILabel alloc] init];
        subTitlesLabel.frame = CGRectMake(10, 15+60*i, 90, 30);
        subTitlesLabel.font = [UIFont systemFontOfSize:14];
        subTitlesLabel.textColor = [UIColor blackColor];
        subTitlesLabel.text = [NSString stringWithFormat:@"%@",[subTitles objectAtIndex:i]];
        [whiteView addSubview:subTitlesLabel];
        
        UITextField * textFields = [[UITextField alloc] init];
        textFields.frame = CGRectMake(subTitlesLabel.x+subTitlesLabel.width, 15+60*i, 150, 30);
        textFields.font = [UIFont systemFontOfSize:14];
        textFields.placeholder = [NSString stringWithFormat:@"%@",[placeHolderTexts objectAtIndex:i]];
        [whiteView addSubview:textFields];
    }
    
    //确定按钮
    UIButton * determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    determineBtn.frame = CGRectMake(10, SCREEN_HEIGHT-150, SCREEN_WIDTH-20, 35);
    determineBtn.backgroundColor = MintGreenColor;
    determineBtn.layer.cornerRadius = 5;
    determineBtn.layer.masksToBounds = YES;
    [determineBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [determineBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:determineBtn];
}

- (void)ChangePwdNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
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
