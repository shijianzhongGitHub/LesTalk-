//
//  GPHomController.m
//  GPHandMade
//
//  Created by dandan on 16/6/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "GPHomController.h"
#import "GPFocusController.h"
#import "GPDaRenController.h"
#import "GPEventController.h"

#import "ScreeningViewController.h"
#import "SearchViewController.h"
#import "HotInformationController.h"
#import "NearGroupViewController.h"
#import "MyMatchingController.h"

@interface GPHomController ()<UIGestureRecognizerDelegate>


@property (nonatomic, strong) UIView * upCoverView;
@property (nonatomic, strong) UIView * downCoverView;

/** 背景图片 */
@property (nonatomic, strong) UIImageView * dynamicBackImageView;
@property (nonatomic, strong) UIView      * backView;
@property (nonatomic, strong) UILabel     * navTitleLabel;

@end

@implementation GPHomController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 初始化样式
    [self setupView];
    // 添加子控制器
    [self addAllChildVc];
}
#pragma mark - 初始化子控件
- (void)setupView
{
    // 设置标题栏样式
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight) {
        *titleScrollViewColor = MintGreenColor;
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
- (void)addAllChildVc
{
    UIButton * dropDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dropDownBtn.frame = CGRectMake(SCREEN_WIDTH-35, 0, 35, 64);
    dropDownBtn.backgroundColor = MintGreenColor;
    [dropDownBtn setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal];
    [dropDownBtn setImageEdgeInsets:UIEdgeInsetsMake(22, 0, 0, 0)];
    [dropDownBtn addTarget:self action:@selector(dropDownClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dropDownBtn];
    
    GPDaRenController *daRenVc = [[GPDaRenController alloc]init];
    daRenVc.title = @"附近的人";
    [self addChildViewController:daRenVc];
    
    UIImageView * hotImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lesTalk"]];
    hotImageView.frame = CGRectMake(10, 0, 30, 30);
    hotImageView.backgroundColor = [UIColor redColor];
    
    GPDaRenController *starsVc = [[GPDaRenController alloc]init];
    starsVc.title = @"🔥";
    [starsVc.inputView addSubview:hotImageView];
    starsVc.inputView.backgroundColor = [UIColor redColor];
    [self addChildViewController:starsVc];
    
    MyMatchingController *myMatchingVc = [[MyMatchingController alloc]init];
    myMatchingVc.title = @"匹配";
    [myMatchingVc.inputView addSubview:hotImageView];
    myMatchingVc.inputView.backgroundColor = [UIColor redColor];
    [self addChildViewController:myMatchingVc];
    
    NearGroupViewController *featureVc = [[NearGroupViewController alloc]init];
    featureVc.title = @"附近的群";
    [self addChildViewController:featureVc];
    
    HotInformationController *newsVc = [[HotInformationController alloc]init];
    newsVc.title = @"资讯";
    [self addChildViewController:newsVc];
    
    GPEventController *eventVc = [[GPEventController alloc]init];
    eventVc.title = @"动态\t\t";
    [self addChildViewController:eventVc];

}

- (void)dropDownClick:(UIButton *)btn
{
    UIView * upCoverView = [[UIView alloc] init];
    upCoverView.backgroundColor = [UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:0.0];
    upCoverView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    [self.view addSubview:upCoverView];
    self.upCoverView = upCoverView;
    
    UIView * downCoverView = [[UIView alloc] init];
    downCoverView.backgroundColor = [UIColor colorWithRed:25/255.0 green:29/255.0 blue:30/255.0 alpha:0.6];
    downCoverView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:downCoverView];
    self.downCoverView = downCoverView;
    
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(downTapView:)];
    tap.delegate = self;
    [downCoverView addGestureRecognizer:tap];
    
    UIView * sheetView = [[UIView alloc] init];
    sheetView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 88);
    sheetView.backgroundColor = [UIColor whiteColor];
    [downCoverView addSubview:sheetView];
    
    UIButton * screeningBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    screeningBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 43.5);
    [screeningBtn setTitle:@"筛选" forState:UIControlStateNormal];
    screeningBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [screeningBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, SCREEN_WIDTH-100)];
    [screeningBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [screeningBtn setImage:[UIImage imageNamed:@"筛选-筛选"] forState:UIControlStateNormal];
    [screeningBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 13, 0, SCREEN_WIDTH-30)];
    [screeningBtn addTarget:self action:@selector(screeningBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [downCoverView addSubview:screeningBtn];
    
    UIImageView * screeningNext = [[UIImageView alloc] init];
    screeningNext.frame = CGRectMake(SCREEN_WIDTH-25, 12, 9, 17);
    [screeningNext setImage:[UIImage imageNamed:@"进入-拷贝-4"]];
    [downCoverView addSubview:screeningNext];
    
    UIView * lineView = [[UIView alloc] init];
    lineView .frame = CGRectMake(0, 43.5, SCREEN_WIDTH, 0.5);
    lineView.backgroundColor = [UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:0.6];
    [downCoverView addSubview:lineView];
    
    UIButton * searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 44, SCREEN_WIDTH, 43.5);
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [searchBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, SCREEN_WIDTH-100)];
    [searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"搜索-拷贝"] forState:UIControlStateNormal];
    [searchBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 13, 0, SCREEN_WIDTH-30)];
    [searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [downCoverView addSubview:searchBtn];
    
    UIImageView * searchNext = [[UIImageView alloc] init];
    searchNext.frame = CGRectMake(SCREEN_WIDTH-25, 56, 9, 17);
    [searchNext setImage:[UIImage imageNamed:@"进入-拷贝-4"]];
    [downCoverView addSubview:searchNext];    
}

- (void)screeningBtnClick:(UIButton *)btn
{
    ScreeningViewController * screeningVc = [[ScreeningViewController alloc] init];
    [self.navigationController pushViewController:screeningVc animated:YES];
    
    [self.upCoverView removeFromSuperview];
    [self.downCoverView removeFromSuperview];
}

- (void)searchBtnClick:(UIButton *)btn
{
    SearchViewController * searchVc = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVc animated:YES];
    
    [self.upCoverView removeFromSuperview];
    [self.downCoverView removeFromSuperview];
}

- (void)downTapView:(UIGestureRecognizer *)tap
{
    [self.upCoverView removeFromSuperview];
    [self.downCoverView removeFromSuperview];
}

@end
