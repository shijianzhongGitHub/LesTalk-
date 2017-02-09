//
//  MyActiveController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "MyActiveController.h"
#import "MyNavigationView.h"

@interface MyActiveController ()
{
    MyNavigationView * navView;
}

@end

@implementation MyActiveController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupMyActiveUI];
}

- (void)setupMyActiveUI
{
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"我的活跃度" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(MyActiveNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIView * topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 120);
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIImageView * userImgView = [[UIImageView alloc] init];
    userImgView.frame = CGRectMake(20, 10, 60, 60);
    userImgView.layer.cornerRadius = 15;
    userImgView.layer.masksToBounds = YES;
    [userImgView setImage:[UIImage imageNamed:@"头像女"]];
    [topView addSubview:userImgView];
    
    UILabel * userName = [[UILabel alloc] init];
    userName.frame = CGRectMake(userImgView.x+userImgView.width+10, 15, 60, 20);
    userName.text = @"图个哈";
    userName.textColor = [UIColor blackColor];
    userName.font = [UIFont boldSystemFontOfSize:14];
    [topView addSubview:userName];
    
    //连续时间
    UILabel * continuousTime = [[UILabel alloc] init];
    continuousTime.frame = CGRectMake(userImgView.x+userImgView.width+10, 40, 100, 20);
    continuousTime.text = @"已连续签到1天";
    continuousTime.textColor = [UIColor grayColor];
    continuousTime.font = [UIFont systemFontOfSize:12];
    [topView addSubview:continuousTime];
    
    //签到
    UIButton * SignInBtn = [[UIButton alloc] init];
    SignInBtn.frame = CGRectMake(SCREEN_WIDTH-90, 20, 80, 25);
    [SignInBtn setTitle:@"下次签到+6" forState:UIControlStateNormal];
    SignInBtn.layer.cornerRadius = 5;
    [SignInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    SignInBtn.backgroundColor = [UIColor grayColor];
    SignInBtn.backgroundColor = [UIColor redColor];
    SignInBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [topView addSubview:SignInBtn];
    
    UIView * lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, userImgView.y+userImgView.height+13, SCREEN_WIDTH, 0.5);
    lineView.backgroundColor = AppBackgroupColor;
    [topView addSubview:lineView];
    
    UIView * shulineView = [[UIView alloc] init];
    shulineView.frame = CGRectMake(SCREEN_WIDTH/2, userImgView.y+userImgView.height+25, 0.5, 30);
    shulineView.backgroundColor = AppBackgroupColor;
    [topView addSubview:shulineView];
    
    UILabel * activeScore = [[UILabel alloc] init];
    activeScore.frame = CGRectMake(userImgView.x, lineView.y+10, 120, 20);
    activeScore.text = @"活跃度积分：9652";
    activeScore.textColor = [UIColor grayColor];
    activeScore.font = [UIFont systemFontOfSize:12];
    [topView addSubview:activeScore];
    
    UILabel * exchangeInfo = [[UILabel alloc] init];
    exchangeInfo.frame = CGRectMake(SCREEN_WIDTH/2+30, lineView.y+10, 120, 20);
    exchangeInfo.text = @"兑换详情：2";
    exchangeInfo.textColor = [UIColor grayColor];
    exchangeInfo.font = [UIFont systemFontOfSize:12];
    [topView addSubview:exchangeInfo];
    
    UIView * centerView = [[UIView alloc] init];
    centerView.frame = CGRectMake(0, topView.y+topView.height+10, SCREEN_WIDTH, 180);
    centerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:centerView];
    
    UIView * centerShulineView = [[UIView alloc] init];
    centerShulineView.frame = CGRectMake(SCREEN_WIDTH/2, 0, 0.5, centerView.height);
    centerShulineView.backgroundColor = AppBackgroupColor;
    [centerView addSubview:centerShulineView];
    
    UIView * centerLineView = [[UIView alloc] init];
    centerLineView.frame = CGRectMake(SCREEN_WIDTH/2, centerView.height/2, SCREEN_WIDTH, 0.5);
    centerLineView.backgroundColor = AppBackgroupColor;
    [centerView addSubview:centerLineView];
    
    UILabel * scoreLeftLabel = [[UILabel alloc] init];
    scoreLeftLabel.frame = CGRectMake(5, 5, 60, 12);
    scoreLeftLabel.text = @"积分商城";
    scoreLeftLabel.textColor = [UIColor grayColor];
    scoreLeftLabel.font = [UIFont systemFontOfSize:8];
    [centerView addSubview:scoreLeftLabel];
    
    //优惠券
    UILabel * couponsLeftLabel = [[UILabel alloc] init];
    couponsLeftLabel.frame = CGRectMake(5, 16, 80, 16);
    couponsLeftLabel.text = @"唐狮优惠券";
    couponsLeftLabel.textColor = [UIColor grayColor];
    couponsLeftLabel.font = [UIFont systemFontOfSize:12];
    [centerView addSubview:couponsLeftLabel];
    
    UIImageView * hotImg = [[UIImageView alloc] init];
    hotImg.frame = CGRectMake(SCREEN_WIDTH/2-35, 0, 35, 36);
    [hotImg setImage:[UIImage imageNamed:@"最热"]];
    [centerView addSubview:hotImg];
    
    UIImageView * numLeftImg = [[UIImageView alloc] init];
    numLeftImg.frame = CGRectMake(5, 33, 16, 16);
    numLeftImg.layer.cornerRadius = 8;
    numLeftImg.layer.masksToBounds = YES;
    [numLeftImg setImage:[UIImage imageNamed:@"活跃度-(1)"]];
    [centerView addSubview:numLeftImg];
    
    UILabel * numLeftLabel = [[UILabel alloc] init];
    numLeftLabel.frame = CGRectMake(37, 34, 60, 16);
    numLeftLabel.text = @"25662";
    numLeftLabel.textColor = [UIColor grayColor];
    numLeftLabel.font = [UIFont systemFontOfSize:14];
    [centerView addSubview:numLeftLabel];
    
    UIImageView * goodsLeftImg = [[UIImageView alloc] init];
    goodsLeftImg.frame = CGRectMake(20, numLeftLabel.y+numLeftLabel.height+5, SCREEN_WIDTH/2-40, SCREEN_WIDTH/2-40);
    goodsLeftImg.layer.cornerRadius = 8;
    goodsLeftImg.layer.masksToBounds = YES;
    goodsLeftImg.image = [UIImage imageNamed:@"兑换成功"];
    [centerView addSubview:goodsLeftImg];
    
    UILabel * scoreRightLabel = [[UILabel alloc] init];
    scoreRightLabel.frame = CGRectMake(5+SCREEN_WIDTH/2, 5, 60, 12);
    scoreRightLabel.text = @"积分商城";
    scoreRightLabel.textColor = [UIColor grayColor];
    scoreRightLabel.font = [UIFont systemFontOfSize:8];
    [centerView addSubview:scoreRightLabel];
    
    //优惠券
    UILabel * couponsRightLabel = [[UILabel alloc] init];
    couponsRightLabel.frame = CGRectMake(5+SCREEN_WIDTH/2, 16, 80, 16);
    couponsRightLabel.text = @"玫瑰花";
    couponsRightLabel.textColor = [UIColor grayColor];
    couponsRightLabel.font = [UIFont systemFontOfSize:12];
    [centerView addSubview:couponsRightLabel];
    
    UIImageView * numRightImg = [[UIImageView alloc] init];
    numRightImg.frame = CGRectMake(5+SCREEN_WIDTH/2, 33, 16, 16);
    numRightImg.layer.cornerRadius = 8;
    numRightImg.layer.masksToBounds = YES;
    [numRightImg setImage:[UIImage imageNamed:@"活跃度-(1)"]];
    [centerView addSubview:numRightImg];
    
    UILabel * numRightLabel = [[UILabel alloc] init];
    numRightLabel.frame = CGRectMake(37+SCREEN_WIDTH/2, 34, 60, 16);
    numRightLabel.text = @"1";
    numRightLabel.textColor = [UIColor grayColor];
    numRightLabel.font = [UIFont systemFontOfSize:14];
    [centerView addSubview:numRightLabel];
    
    UIImageView * goodsImg = [[UIImageView alloc] init];
    goodsImg.frame = CGRectMake(SCREEN_WIDTH-60, numRightLabel.y+numRightLabel.height, 30, 30);
    [goodsImg setImage:[UIImage imageNamed:@"花"]];
    [centerView addSubview:goodsImg];
    
    UILabel * scoreRightDownLabel = [[UILabel alloc] init];
    scoreRightDownLabel.frame = CGRectMake(5+SCREEN_WIDTH/2, 5+centerView.height/2, 60, 12);
    scoreRightDownLabel.text = @"积分商城";
    scoreRightDownLabel.textColor = [UIColor grayColor];
    scoreRightDownLabel.font = [UIFont systemFontOfSize:8];
    [centerView addSubview:scoreRightDownLabel];
    
    //优惠券
    UILabel * couponsRightDownLabel = [[UILabel alloc] init];
    couponsRightDownLabel.frame = CGRectMake(5+SCREEN_WIDTH/2, 16+centerView.height/2, 80, 16);
    couponsRightDownLabel.text = @"会员体验7天";
    couponsRightDownLabel.textColor = [UIColor grayColor];
    couponsRightDownLabel.font = [UIFont systemFontOfSize:12];
    [centerView addSubview:couponsRightDownLabel];
    
    UIImageView * numRightDownImg = [[UIImageView alloc] init];
    numRightDownImg.frame = CGRectMake(5+SCREEN_WIDTH/2, 33+centerView.height/2, 16, 16);
    numRightDownImg.layer.cornerRadius = 8;
    numRightDownImg.layer.masksToBounds = YES;
    [numRightDownImg setImage:[UIImage imageNamed:@"活跃度-(1)"]];
    [centerView addSubview:numRightDownImg];
    
    UILabel * numRightDownLabel = [[UILabel alloc] init];
    numRightDownLabel.frame = CGRectMake(37+SCREEN_WIDTH/2, 34+centerView.height/2, 60, 16);
    numRightDownLabel.text = @"1000";
    numRightDownLabel.textColor = [UIColor grayColor];
    numRightDownLabel.font = [UIFont systemFontOfSize:14];
    [centerView addSubview:numRightDownLabel];
    
    UIImageView * goodsDownImg = [[UIImageView alloc] init];
    goodsDownImg.frame = CGRectMake(SCREEN_WIDTH-60, numRightLabel.y+numRightLabel.height+centerView.height/2, 30, 30);
    [goodsDownImg setImage:[UIImage imageNamed:@"会员-拷贝"]];
    [centerView addSubview:goodsDownImg];
    
    UIView * bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, centerView.y+centerView.height+35, SCREEN_WIDTH, SCREEN_HEIGHT-centerView.y+centerView.height+10);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel * goodsLabel = [[UILabel alloc] init];
    goodsLabel.frame = CGRectMake(0, centerView.y+centerView.height+5, SCREEN_WIDTH, 25);
    goodsLabel.textColor = [UIColor blackColor];
    goodsLabel.text = @"积分商品";
    goodsLabel.textAlignment = NSTextAlignmentCenter;
    goodsLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:goodsLabel];
    
    UILabel * goodsNameLeft = [[UILabel alloc] init];
    goodsNameLeft.frame = CGRectMake(5, 5, SCREEN_WIDTH-10, 15);
    goodsNameLeft.textAlignment = NSTextAlignmentLeft;
    goodsNameLeft.textColor = [UIColor blackColor];
    goodsNameLeft.text = @"呷哺呷哺代金券";
    goodsNameLeft.font = [UIFont systemFontOfSize:12];
    [bottomView addSubview:goodsNameLeft];
    
    UILabel * goodsNameRight = [[UILabel alloc] init];
    goodsNameRight.frame = CGRectMake(5+SCREEN_WIDTH/2, 5, SCREEN_WIDTH-10, 15);
    goodsNameRight.textAlignment = NSTextAlignmentLeft;
    goodsNameRight.textColor = [UIColor blackColor];
    goodsNameRight.text = @"呷哺呷哺代金券";
    goodsNameRight.font = [UIFont systemFontOfSize:12];
    [bottomView addSubview:goodsNameRight];
    
    UILabel * numNameLeft = [[UILabel alloc] init];
    numNameLeft.frame = CGRectMake(5, 25, SCREEN_WIDTH-10, 15);
    numNameLeft.textAlignment = NSTextAlignmentLeft;
    numNameLeft.textColor = [UIColor redColor];
    numNameLeft.text = @"2500";
    numNameLeft.font = [UIFont systemFontOfSize:12];
    [bottomView addSubview:numNameLeft];
    
    UILabel * numNameRight = [[UILabel alloc] init];
    numNameRight.frame = CGRectMake(5+SCREEN_WIDTH/2, 25, SCREEN_WIDTH-10, 15);
    numNameRight.textAlignment = NSTextAlignmentLeft;
    numNameRight.textColor = [UIColor redColor];
    numNameRight.text = @"2500";
    numNameRight.font = [UIFont systemFontOfSize:12];
    [bottomView addSubview:numNameRight];
    
    UIImageView * goodsImgLeft = [[UIImageView alloc] init];
    goodsImgLeft.frame = CGRectMake(20, 45, SCREEN_WIDTH/2-40, (SCREEN_WIDTH/2-40)/2);
    [goodsImgLeft setImage:[UIImage imageNamed:@"兑换成功"]];
    [bottomView addSubview:goodsImgLeft];
    
    UIImageView * goodsImgRight = [[UIImageView alloc] init];
    goodsImgRight.frame = CGRectMake(20+SCREEN_WIDTH/2, 45, SCREEN_WIDTH/2-40, (SCREEN_WIDTH/2-40)/2);
    [goodsImgRight setImage:[UIImage imageNamed:@"兑换成功"]];
    [bottomView addSubview:goodsImgRight];
    
    UIView * bottomShulineView = [[UIView alloc] init];
    bottomShulineView.frame = CGRectMake(SCREEN_WIDTH/2, 0, 0.5, bottomView.height);
    bottomShulineView.backgroundColor = AppBackgroupColor;
    [bottomView addSubview:bottomShulineView];
    
}

- (void)MyActiveNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
