//
//  CreateGroupController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/3.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "CreateGroupController.h"
#import "MyNavigationView.h"

@interface CreateGroupController ()
{
    MyNavigationView *navView;
}

@end

@implementation CreateGroupController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCreateGroupUI];
}

- (void)setupCreateGroupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"创建群" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(createGroupNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    // Do any additional setup after loading the view.
    
    CGFloat addImageViewWidth = 60;
    
    UIImageView * addImageView = [[UIImageView alloc] init];
    addImageView.frame = CGRectMake((SCREEN_WIDTH-addImageViewWidth)/2, 90, addImageViewWidth, addImageViewWidth);
    [addImageView setImage:[UIImage imageNamed:@"添加图片按钮"]];
    [self.view addSubview:addImageView];
    
    UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(10, SCREEN_HEIGHT-100, SCREEN_WIDTH-20, 30);
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    submitBtn.backgroundColor = MintGreenColor;
    [self.view addSubview:submitBtn];
    
    UILabel * createGroupTitle = [[UILabel alloc] init];
    createGroupTitle.frame = CGRectMake(0, addImageView.y+addImageView.height+30, SCREEN_WIDTH, 20);
    createGroupTitle.textColor = [UIColor lightGrayColor];
    createGroupTitle.font = [UIFont systemFontOfSize:12];
    createGroupTitle.text = @"填写群名称(2-10个字)";
    createGroupTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:createGroupTitle];
    
    UIView * createLineView = [[UIView alloc] init];
    createLineView.frame = CGRectMake(60, createGroupTitle.y+createGroupTitle.height+5, SCREEN_WIDTH-120, 0.5);
    createLineView.backgroundColor = AppBackgroupColor;
    [self.view addSubview:createLineView];
    
    UITextView * introductionTextView = [[UITextView alloc] init];
    introductionTextView.frame = CGRectMake(0, createLineView.y+createLineView.height+85, SCREEN_WIDTH, 90);
//    introductionTextView.layer.borderColor = [AppBackgroupColor CGColor];
    introductionTextView.layer.borderColor = [[UIColor blackColor] CGColor];
    introductionTextView.layer.borderWidth = 0.5;
    [self.view addSubview:introductionTextView];
    
    UILabel * textViewLabel = [[UILabel alloc] init];
    textViewLabel.frame = CGRectMake(0, introductionTextView.height/2, introductionTextView.width, 20);
    textViewLabel.text = @"填写简介";
    textViewLabel.textColor = [UIColor grayColor];
    textViewLabel.textAlignment = NSTextAlignmentCenter;
    textViewLabel.font = [UIFont systemFontOfSize:12];
    [introductionTextView addSubview:textViewLabel];
    
}

- (void)createGroupNavigationClick:(UIButton *)btn
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
