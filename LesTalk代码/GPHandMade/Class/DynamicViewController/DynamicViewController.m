//
//  DynamicViewController.m
//  LesTalk
//
//  Created by 史建忠 on 2016/10/27.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "DynamicViewController.h"
#import "MyNavigationView.h"
#import "UIView+Extension.h"

@interface DynamicViewController ()
{
    MyNavigationView * navView;
}

/** 背景图片 */
@property (nonatomic, strong) UIImageView * dynamicBackImageView;
@property (nonatomic, strong) UIView      * backView;

@end

@implementation DynamicViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"我的匹配" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(DynamicNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    [self setupDynamicUI];
}

- (void)setupDynamicUI
{
    UIView  * backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    self.backView = backView;
    
    UIImageView * userImageView = [[UIImageView alloc] init];
    userImageView.frame = CGRectMake(8, 75-64, [UIScreen mainScreen].bounds.size.width-16, [UIScreen mainScreen].bounds.size.width-16);
    userImageView.image = [UIImage imageNamed:@"头像"];
    userImageView.layer.cornerRadius = 5;
    userImageView.layer.masksToBounds = YES;
    [backView addSubview:userImageView];
    
    UIButton * enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    enterBtn.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-44-64, [UIScreen mainScreen].bounds.size.width, 44);
    enterBtn.backgroundColor = [UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0];
    [enterBtn setTitle:@"进入Let's talk" forState:UIControlStateNormal];
    enterBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [enterBtn addTarget:self action:@selector(enterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [enterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backView addSubview:enterBtn];
    
    UIImageView * titleBackView = [[UIImageView alloc] init];
    titleBackView.frame = CGRectMake(6, userImageView.height-4, [UIScreen mainScreen].bounds.size.width-12, 60);
    titleBackView.image = [UIImage imageNamed:@"匹配块"];
    [backView addSubview:titleBackView];
    
    UILabel * userNickLabel = [[UILabel alloc] init];
    userNickLabel.frame = CGRectMake(0, 3, titleBackView.width, 20);
    userNickLabel.text = @"萌萌哒";
    userNickLabel.font = [UIFont systemFontOfSize:12];
    userNickLabel.textAlignment = NSTextAlignmentCenter;
    [titleBackView addSubview:userNickLabel];
    
    UILabel * ageLabel = [[UILabel alloc] init];
    ageLabel.frame = CGRectMake(0, 20, titleBackView.width/3, 20);
    ageLabel.text = @"年龄：23";
    ageLabel.font = [UIFont systemFontOfSize:10];
    ageLabel.textAlignment = NSTextAlignmentCenter;
    [titleBackView addSubview:ageLabel];
    
    UILabel * heightLabel = [[UILabel alloc] init];
    heightLabel.frame = CGRectMake(titleBackView.width/3, 20, titleBackView.width/3, 20);
    heightLabel.text = @"身高：180CM";
    heightLabel.font = [UIFont systemFontOfSize:10];
    heightLabel.textAlignment = NSTextAlignmentCenter;
    [titleBackView addSubview:heightLabel];
    
    UILabel * stateLabel = [[UILabel alloc] init];
    stateLabel.frame = CGRectMake(titleBackView.width/3*2, 20, titleBackView.width/3, 20);
    stateLabel.text = @"状态：单身";
    stateLabel.font = [UIFont systemFontOfSize:10];
    stateLabel.textAlignment = NSTextAlignmentCenter;
    [titleBackView addSubview:stateLabel];
    
    UIImageView * upSlidingView = [[UIImageView alloc] init];
    upSlidingView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/4-5, titleBackView.y+titleBackView.height+5, [UIScreen mainScreen].bounds.size.width/4, [UIScreen mainScreen].bounds.size.width/4);
    upSlidingView.image = [UIImage imageNamed:@"上滑"];
    [backView addSubview:upSlidingView];
    
    UIImageView * downSliding = [[UIImageView alloc] init];
    downSliding.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/4*2+5, titleBackView.y+titleBackView.height+5, [UIScreen mainScreen].bounds.size.width/4, [UIScreen mainScreen].bounds.size.width/4);
    downSliding.image = [UIImage imageNamed:@"下滑"];
    [backView addSubview:downSliding];
    
    UIImageView * dynamicCoverView = [[UIImageView alloc] init];
    dynamicCoverView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    dynamicCoverView.image = [UIImage imageNamed:@"一起"];
    [self.view addSubview:dynamicCoverView];
    dynamicCoverView.userInteractionEnabled = YES;
    self.dynamicBackImageView = dynamicCoverView;
    
    UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/4, [UIScreen mainScreen].bounds.size.height/2+40, [UIScreen mainScreen].bounds.size.width/2, 90);
    [closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [dynamicCoverView addSubview:closeBtn];
}

#pragma mark - 初始化子控件
- (void)setupView
{
    // 设置标题栏样式
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight) {
        *titleScrollViewColor = [UIColor whiteColor];
        *norColor = [UIColor darkGrayColor];
        *selColor = [UIColor redColor];
        *titleHeight = GPTitlesViewH;
    }];
    // 设置下标
    [self setUpUnderLineEffect:^(BOOL *isShowUnderLine, BOOL *isDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor) {
        
        *isShowUnderLine = YES;
        *underLineColor = [UIColor redColor];
    }];
}

- (void)enterBtnClick:(UIButton *)btn
{
//    [self.backView removeFromSuperview];
}

- (void)closeBtnClick:(UIButton *)btn
{
    [self.dynamicBackImageView removeFromSuperview];
}

- (void)DynamicNavigationClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
