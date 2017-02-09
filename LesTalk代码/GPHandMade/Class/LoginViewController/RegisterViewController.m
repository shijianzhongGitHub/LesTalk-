//
//  RegisterViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/8.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "RegisterViewController.h"
#import "HBTabBarController.h"

#import "MyNavigationView.h"

@interface RegisterViewController ()
{
    UITextField      * phoneNumField;
    UITextField      * checkCodeField;
    UITextField      * pwdViewField;
    UIButton         * checkCodeBtn;
    UITextField      * pwdAgainField;
    UITextField      * emailField;
    UIButton         * registerBtn;
    
    MyNavigationView * navView;
}

@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupRegisterUI];
}

- (void)setupRegisterUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"注册" andLeftBBIImage:[UIImage imageNamed:@"back"] andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:@"登录" andSEL:@selector(RegisterNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    phoneNumField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-40, 50)];
    phoneNumField.placeholder = @"请输入手机号";
    [self.view addSubview:phoneNumField];
    
    checkCodeField = [[UITextField alloc] initWithFrame:CGRectMake(20, 160, (SCREEN_WIDTH-60)/2, 50)];
    checkCodeField.placeholder = @"请输入验证码";
    [self.view addSubview:checkCodeField];
    
    checkCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-(SCREEN_WIDTH-60)/2, 165, (SCREEN_WIDTH-60)/2-30, 35)];
    checkCodeBtn.layer.cornerRadius = 10;
    checkCodeBtn.layer.masksToBounds = YES;
    checkCodeBtn.backgroundColor = MintGreenColor;
    [checkCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    checkCodeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [checkCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:checkCodeBtn];
    
    pwdViewField = [[UITextField alloc] initWithFrame:CGRectMake(20, 220, SCREEN_WIDTH-40, 50)];
    pwdViewField.placeholder = @"请输入密码";
    [self.view addSubview:pwdViewField];
    
    pwdViewField = [[UITextField alloc] initWithFrame:CGRectMake(20, 280, SCREEN_WIDTH-40, 50)];
    pwdViewField.placeholder = @"请输再次输入密码";
    [self.view addSubview:pwdViewField];
    
    emailField = [[UITextField alloc] initWithFrame:CGRectMake(20, 330, SCREEN_WIDTH-40, 50)];
    emailField.placeholder = @"请输入邮箱";
    [self.view addSubview:emailField];
    
    UIButton * acceptBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, 350, SCREEN_WIDTH-40, 50)];
    [acceptBtn setTitle:@"接受我们的最新活动和资讯" forState:UIControlStateNormal];
    acceptBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [acceptBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:acceptBtn];
    
    registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, SCREEN_WIDTH-40, 50)];
    registerBtn.layer.cornerRadius = 10;
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.backgroundColor = MintGreenColor;
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
}

- (void)RegisterNavigationClick:(UIButton *)navBtn
{
    HBTabBarController * hbtabBarVC = [[HBTabBarController alloc] init];
    [self presentViewController:hbtabBarVC animated:NO completion:nil];
}

@end
