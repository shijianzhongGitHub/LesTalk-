//
//  LoginViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/8.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HBTabBarController.h"
#import "MyNavigationView.h"
#import "ForgotPasswordController.h"

@interface LoginViewController ()
{
    MyNavigationView * navView;
    
    UITextField  * phoneNumField;
    UITextField  * pwdTextField;
    UIButton     * logBtn;
    UIButton     * registerBtn;
    UIButton     * QQBtn;
    UIButton     * WeChatBtn;
    
    UIView       * phoneNumView;
    UIView       * pwdTextView;
    UIView       * leftlineView;
    UIView       * rightLineView;
    UILabel      * otherTitle;
    UIView       * lineView;
    
    UIButton     * chineseBtn;
    UIButton     * taiyuBtn;
    UIButton     * englishBtn;
    
}

@end

@implementation LoginViewController

//- (void)viewWillAppear:(BOOL)animated
//{
//    self.navigationController.navigationBar.hidden = YES;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupLoginUI];
}

- (void)setupLoginUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"登录" andLeftBBIImage:[UIImage imageNamed:@""] andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:@"注册" andSEL:@selector(loginNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIView * phoneLine = [[UIView alloc] initWithFrame:CGRectMake(0, 160, SCREEN_WIDTH, 0.4)];
    phoneLine.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:phoneLine];
    
    UIImageView * phoneIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"手机号"]];
    phoneIcon.frame = CGRectMake(35, 125, 12, 19);
    [self.view addSubview:phoneIcon];

    UIView * pwdLine = [[UIView alloc] initWithFrame:CGRectMake(0, 220, SCREEN_WIDTH, 0.4)];
    pwdLine.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pwdLine];
    
    UIImageView * pwdIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"密码"]];
    pwdIcon.frame = CGRectMake(35, 185, 14, 17);
    [self.view addSubview:pwdIcon];
    
    phoneNumField = [[UITextField alloc] initWithFrame:CGRectMake(60, 110, 216, 102/2)];
    phoneNumField.placeholder = @"请输入手机号";
    [phoneNumField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:phoneNumField];
    
    pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 170, 216, 102/2)];
    pwdTextField.placeholder = @"请输入密码";
    [pwdTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:pwdTextField];
    
    logBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    logBtn.frame = CGRectMake(20, 270, SCREEN_WIDTH-40, 102/2);
    logBtn.backgroundColor = MintGreenColor;
    logBtn.layer.cornerRadius = 10;
    [logBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [logBtn setTitle:@"登录" forState:UIControlStateNormal];
    [logBtn addTarget:self action:@selector(logBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logBtn];
    
    registerBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(20, 340, SCREEN_WIDTH-40, 102/2);
    registerBtn.backgroundColor = [UIColor clearColor];
    registerBtn.layer.cornerRadius = 10;
    [registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [registerBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [registerBtn addTarget:self action:@selector(forgotBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    CGFloat otherTitleW = 120;
    
    leftlineView = [[UIView alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT-180, (SCREEN_WIDTH-30-otherTitleW)/2, 0.5)];
    leftlineView.backgroundColor = AppBackgroupColor;
    [self.view addSubview:leftlineView];
    
    CGFloat margin = (SCREEN_WIDTH - SCREEN_WIDTH/5*3)/4;
    
    /*
    NSArray * languages = @[@"汉语",@"泰语",@"英语"];
    NSArray * languagesSelected = @[@"汉语选中",@"泰语选中",@"英语选中"];
    for (int i=0; i<3; i++)
    {
        UIButton * languageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        languageBtn.frame = CGRectMake(margin+(SCREEN_WIDTH/5+margin)*i, registerBtn.y+registerBtn.height+30, SCREEN_WIDTH/5, 30);
        [languageBtn setImage:[UIImage imageNamed:[languages objectAtIndex:i]] forState:UIControlStateNormal];
        languageBtn.tag = i;
        [languageBtn setImage:[UIImage imageNamed:[languagesSelected objectAtIndex:i]] forState:UIControlStateSelected];
        [languageBtn addTarget:self action:@selector(languageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:languageBtn];
    }*/
    
    chineseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chineseBtn.frame = CGRectMake(margin+(SCREEN_WIDTH/5+margin)*0, registerBtn.y+registerBtn.height+30, SCREEN_WIDTH/5, 30);
    [chineseBtn setImage:[UIImage imageNamed:@"汉语"] forState:UIControlStateNormal];
    chineseBtn.tag = 0;
    [chineseBtn setImage:[UIImage imageNamed:@"汉语选中"] forState:UIControlStateSelected];
    [chineseBtn addTarget:self action:@selector(languageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chineseBtn];
    
    taiyuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    taiyuBtn.frame = CGRectMake(margin+(SCREEN_WIDTH/5+margin)*1, registerBtn.y+registerBtn.height+30, SCREEN_WIDTH/5, 30);
    [taiyuBtn setImage:[UIImage imageNamed:@"泰语"] forState:UIControlStateNormal];
    taiyuBtn.tag = 1;
    [taiyuBtn setImage:[UIImage imageNamed:@"泰语选中"] forState:UIControlStateSelected];
    [taiyuBtn addTarget:self action:@selector(languageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:taiyuBtn];
    
    englishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    englishBtn.frame = CGRectMake(margin+(SCREEN_WIDTH/5+margin)*2, registerBtn.y+registerBtn.height+30, SCREEN_WIDTH/5, 30);
    [englishBtn setImage:[UIImage imageNamed:@"英语"] forState:UIControlStateNormal];
    englishBtn.tag = 2;
    [englishBtn setImage:[UIImage imageNamed:@"英语选中"] forState:UIControlStateSelected];
    [englishBtn addTarget:self action:@selector(languageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:englishBtn];
    
    otherTitle = [[UILabel alloc] initWithFrame:CGRectMake(10+leftlineView.bounds.size.width+5, SCREEN_HEIGHT-190, otherTitleW, 20)];
    otherTitle.textColor = AppBackgroupColor;
    otherTitle.text = @"第三方登录";
    otherTitle.textAlignment = NSTextAlignmentCenter;
    otherTitle.font = [UIFont boldSystemFontOfSize:14];
    [self.view addSubview:otherTitle];
    
    rightLineView = [[UIView alloc] initWithFrame:CGRectMake(20+leftlineView.bounds.size.width+otherTitleW, SCREEN_HEIGHT-180, (SCREEN_WIDTH-30-otherTitleW)/2, 0.5)];
    rightLineView.backgroundColor = AppBackgroupColor;
    [self.view addSubview:rightLineView];
    
    QQBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    QQBtn.frame = CGRectMake(85, SCREEN_HEIGHT-100, 45, 45);
    [QQBtn setImage:[UIImage imageNamed:@"wx"] forState:UIControlStateNormal];
    [self.view addSubview:QQBtn];
    
    
    WeChatBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    WeChatBtn.frame = CGRectMake(SCREEN_WIDTH-130, SCREEN_HEIGHT-100, 45, 45);
    [WeChatBtn setImage:[UIImage imageNamed:@"f"] forState:UIControlStateNormal];
    [self.view addSubview:WeChatBtn];
    
}

- (void)logBtnClick:(UIButton *)Btn
{
    HBTabBarController * hbtabBarVC = [[HBTabBarController alloc] init];
    [self presentViewController:hbtabBarVC animated:NO completion:nil];
}

- (void)loginNavigationClick:(UIButton *)Btn
{
    RegisterViewController * registerVC = [[RegisterViewController alloc] init];
    [self presentViewController:registerVC animated:NO completion:nil];
}

- (void)forgotBtnClick:(UIButton *)btn
{
    ForgotPasswordController * forgotPwdVC = [[ForgotPasswordController alloc] init];
    [self presentViewController:forgotPwdVC animated:NO completion:nil];
}

- (void)languageBtnClick:(UIButton *)btn
{
    if (btn.tag==0)
    {
        chineseBtn.selected = YES;
        taiyuBtn.selected = NO;
        englishBtn.selected = NO;
    }
    if (btn.tag==1)
    {
        chineseBtn.selected = NO;
        taiyuBtn.selected = YES;
        englishBtn.selected = NO;
    }
    if (btn.tag==2)
    {
        chineseBtn.selected = NO;
        taiyuBtn.selected = NO;
        englishBtn.selected = YES;
    }
}

@end
