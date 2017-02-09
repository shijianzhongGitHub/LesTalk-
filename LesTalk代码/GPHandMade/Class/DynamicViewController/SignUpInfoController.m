//
//  SignUpInfoController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/3.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "SignUpInfoController.h"
#import "MyNavigationView.h"

@interface SignUpInfoController ()<UITextFieldDelegate>
{
    MyNavigationView  * navView;
}
@property (nonatomic, strong) UITextField * titlesField;

@end

@implementation SignUpInfoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"报名信息" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:@"" andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:@"提交" andSEL:@selector(signUpNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIView * infoBackView = [[UIView alloc] init];
    infoBackView.frame = CGRectMake(0, 64+44, SCREEN_WIDTH, 44*3);
    infoBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoBackView];
    
    UILabel * noticeLabel = [[UILabel alloc] init];
    noticeLabel.frame = CGRectMake(10, 64, SCREEN_WIDTH, 44);
    noticeLabel.textColor = [UIColor blackColor];
    noticeLabel.font = [UIFont systemFontOfSize:14];
    noticeLabel.text = @"请填写以下信息";
    [self.view addSubview:noticeLabel];
    
    NSArray * titles = @[@"姓名",@"手机号",@"报名人数"];
    for (int i=0; i<3; i++)
    {
        UILabel * titlesStr = [[UILabel alloc] init];
        titlesStr.frame = CGRectMake(10, 44*i, 100, 44);
        titlesStr.textColor = [UIColor blackColor];
        titlesStr.font = [UIFont systemFontOfSize:14];
        titlesStr.text = [NSString stringWithFormat:@"%@",[titles objectAtIndex:i]];
        [infoBackView addSubview:titlesStr];
        
        UITextField * titlesField = [[UITextField alloc] init];
        titlesField.frame = CGRectMake(100, 10+44*i, 150, 30);
        titlesField.textColor = [UIColor blackColor];
        titlesField.font = [UIFont systemFontOfSize:14];
        titlesField.placeholder = [NSString stringWithFormat:@"%@",[titles objectAtIndex:i]];
        titlesField.backgroundColor = AppBackgroupColor;
        titlesField.delegate = self;
        [infoBackView addSubview:titlesField];
        self.titlesField = titlesField;
    }
    
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.titlesField resignFirstResponder];
    [self.view resignFirstResponder];
}

- (void)signUpNavigationClick:(UIButton *)navBtn
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
