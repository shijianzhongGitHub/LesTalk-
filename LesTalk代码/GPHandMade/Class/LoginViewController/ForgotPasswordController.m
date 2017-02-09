//
//  ForgotPasswordController.m
//  OONOCamera
//
//  Created by 史建忠 on 16/8/30.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "ForgotPasswordController.h"
#import "MyNavigationView.h"

@interface ForgotPasswordController ()<UITextFieldDelegate>
{
    UITextField * phoneNumField;
    UITextField * verificationCodeField;
    UITextField * pwdNumField;
    UITextField * pwdAgainNumField;
    UIButton    * sendCodeBtn;
    UIButton    * nextBtn;
    
    MyNavigationView * navView;
}

@property(nonatomic,assign)NSInteger timeCount;
@property(nonatomic,strong)NSTimer * timer;

@end

@implementation ForgotPasswordController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"" andLeftBBIImage:[UIImage imageNamed:@"back"] andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:nil andSEL:@selector(ForgotNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    [self setUpForgotPasswordUI];
}

- (void)setUpForgotPasswordUI
{
    phoneNumField = [[UITextField alloc] init];
    phoneNumField.frame = CGRectMake(20, 140, SCREEN_WIDTH-40, 44);
    phoneNumField.placeholder = @" 请输入手机号";
    phoneNumField.layer.cornerRadius = 3;
    phoneNumField.delegate = self;
    phoneNumField.font = [UIFont systemFontOfSize:14];
    phoneNumField.leftViewMode=UITextFieldViewModeAlways;
    phoneNumField.clearButtonMode = UITextFieldViewModeAlways;
    phoneNumField.keyboardType = UIKeyboardTypeNumberPad;
    phoneNumField.backgroundColor = [UIColor whiteColor];
    phoneNumField.textColor = [UIColor grayColor];
    [self.view addSubview:phoneNumField];
    
    verificationCodeField = [[UITextField alloc] init];
    verificationCodeField.frame = CGRectMake(20, 200, SCREEN_WIDTH-150, 44);
    verificationCodeField.placeholder = @" 请输入验证码";
    verificationCodeField.layer.cornerRadius = 10;
    verificationCodeField.delegate = self;
    verificationCodeField.keyboardType = UIKeyboardTypeNumberPad;
    verificationCodeField.leftViewMode=UITextFieldViewModeAlways;
    verificationCodeField.clearButtonMode = UITextFieldViewModeAlways;
    verificationCodeField.font = [UIFont systemFontOfSize:14];
    verificationCodeField.keyboardType = UIKeyboardTypeDefault;
    verificationCodeField.textColor = [UIColor grayColor];
    [self.view addSubview:verificationCodeField];
    
    sendCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendCodeBtn.frame = CGRectMake(SCREEN_WIDTH-130, 205, 100, 30);
    [sendCodeBtn setBackgroundColor:MintGreenColor];
    sendCodeBtn.layer.cornerRadius = 10;
    [sendCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    sendCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [sendCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendCodeBtn addTarget:self action:@selector(getForgotCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendCodeBtn];
    
    pwdNumField = [[UITextField alloc] init];
    pwdNumField.frame = CGRectMake(20, 260, SCREEN_WIDTH-40, 44);
    pwdNumField.placeholder = @" 请输入新密码";
    pwdNumField.layer.cornerRadius = 3;
    pwdNumField.delegate = self;
    pwdNumField.font = [UIFont systemFontOfSize:14];
    pwdNumField.leftViewMode=UITextFieldViewModeAlways;
    pwdNumField.clearButtonMode = UITextFieldViewModeAlways;
    pwdNumField.keyboardType = UIKeyboardTypeNumberPad;
    pwdNumField.backgroundColor = [UIColor whiteColor];
    pwdNumField.textColor = [UIColor grayColor];
    [self.view addSubview:pwdNumField];
    
    pwdAgainNumField = [[UITextField alloc] init];
    pwdAgainNumField.frame = CGRectMake(20, 310, SCREEN_WIDTH-40, 44);
    pwdAgainNumField.placeholder = @" 请再次输入新密码";
    pwdAgainNumField.layer.cornerRadius = 3;
    pwdAgainNumField.delegate = self;
    pwdAgainNumField.font = [UIFont systemFontOfSize:14];
    pwdAgainNumField.leftViewMode=UITextFieldViewModeAlways;
    pwdAgainNumField.clearButtonMode = UITextFieldViewModeAlways;
    pwdAgainNumField.keyboardType = UIKeyboardTypeNumberPad;
    pwdAgainNumField.backgroundColor = [UIColor whiteColor];
    pwdAgainNumField.textColor = [UIColor grayColor];
    [self.view addSubview:pwdAgainNumField];

    
    nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(20, 460, SCREEN_WIDTH-40, 44);
    [nextBtn setBackgroundColor:MintGreenColor];
    nextBtn.layer.cornerRadius = 10;
    [nextBtn setTitle:@"找回" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

- (void)leftBtnClick:(UIButton *)leftBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getForgotCodeBtnClick
{
    NSLog(@"========sendCodeBtnClick=======");

    sendCodeBtn.enabled=NO;
    self.timeCount=1;
    
    // 倒计时
    self.timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimeCountYanzheng) userInfo:nil repeats:YES];
    
}

- (void)runTimeCountYanzheng
{
    if(self.timeCount<61)
    {
        self.timeCount++;
        NSString *timeString=[NSString stringWithFormat:@"等待(%ld)",61-self.timeCount];
        sendCodeBtn.backgroundColor=[UIColor grayColor];
        [sendCodeBtn setTitle:timeString forState:UIControlStateNormal];
        sendCodeBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        sendCodeBtn.enabled=NO;
    }
    else
    {
        self.timeCount=1;
        [sendCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        sendCodeBtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:48/255.0 blue:48/255.0 alpha:1.0];
        sendCodeBtn.enabled=YES;
        [self.timer invalidate];
        self.timer=nil;
    }
}

- (void)nextBtnClick
{
//    ResetPasswordController * resetPasswordVC = [[ResetPasswordController alloc] init];
//    [self.navigationController pushViewController:resetPasswordVC animated:YES];
}

- (void)ForgotNavigationClick:(UIButton *)navBtn
{
    switch (navBtn.tag) {
        case 101:
        {
            NSLog(@"返回");
            [self.navigationController popViewControllerAnimated:YES];
            
        }
            break;
        case 102:
        {
            NSLog(@"下一步");
        }
        default:
            break;
    }
}

#pragma mark ----------keyboard----------
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [phoneNumField resignFirstResponder];
    [verificationCodeField resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y+150-(self.view.frame.size.height-216.0);//键盘高度216
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];
}
//return 键隐藏键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"scrollView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.275f];
    self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [UIView commitAnimations];
}

@end
