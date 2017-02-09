//
//  UserCertificationController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "UserCertificationController.h"
#import "MyNavigationView.h"

@interface UserCertificationController ()
{
    MyNavigationView * navView;
    
    UIView           * oneView;
    UIView           * twoView;
    UIView           * threeView;
    
    UILabel          * oneLabel;
    UILabel          * twoLabel;
    UILabel          * threeLabel;
    
    UIView           * leftLineView;
    UIView           * rightLineView;
    
}

@end

@implementation UserCertificationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUserCertificationUI];
}

- (void)setupUserCertificationUI
{
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"用户认证" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(UserCertificationNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIView * topBackView = [[UIView alloc] init];
    topBackView.backgroundColor = [UIColor whiteColor];
    topBackView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 135);
    [self.view addSubview:topBackView];
    
    oneView = [[UIView alloc] init];
    oneView.frame = CGRectMake(30, 30, 30, 30);
    oneView.layer.cornerRadius = 15;
    oneView.backgroundColor = [UIColor redColor];
    [topBackView addSubview:oneView];
    oneLabel = [[UILabel alloc] init];
    oneLabel.frame = CGRectMake(0, 5, 30, 20);
    oneLabel.text = @"1";
    oneLabel.textAlignment = NSTextAlignmentCenter;
    oneLabel.font = [UIFont boldSystemFontOfSize:16];
    oneLabel.textColor = [UIColor whiteColor];
    [oneView addSubview:oneLabel];
    
    twoView = [[UIView alloc] init];
    twoView.frame = CGRectMake(SCREEN_WIDTH/2-15, 30, 30, 30);
    twoView.layer.cornerRadius = 15;
    twoView.backgroundColor = [UIColor redColor];
    [topBackView addSubview:twoView];
    twoLabel = [[UILabel alloc] init];
    twoLabel.frame = CGRectMake(0, 5, 30, 20);
    twoLabel.text = @"2";
    twoLabel.textAlignment = NSTextAlignmentCenter;
    twoLabel.font = [UIFont boldSystemFontOfSize:16];
    twoLabel.textColor = [UIColor whiteColor];
    [twoView addSubview:twoLabel];
    
    threeView = [[UIView alloc] init];
    threeView.frame = CGRectMake(SCREEN_WIDTH-60, 30, 30, 30);
    threeView.layer.cornerRadius = 15;
    threeView.backgroundColor = [UIColor redColor];
    [topBackView addSubview:threeView];
    threeLabel = [[UILabel alloc] init];
    threeLabel.frame = CGRectMake(0, 5, 30, 20);
    threeLabel.text = @"3";
    threeLabel.textAlignment = NSTextAlignmentCenter;
    threeLabel.font = [UIFont boldSystemFontOfSize:16];
    threeLabel.textColor = [UIColor whiteColor];
    [threeView addSubview:threeLabel];
    
    leftLineView = [[UIView alloc] init];
    leftLineView.frame = CGRectMake(60, 44.5, (SCREEN_WIDTH-30*5)/2, 1);
    leftLineView.backgroundColor = [UIColor redColor];
    [topBackView addSubview:leftLineView];
    
    rightLineView = [[UIView alloc] init];
    rightLineView.frame = CGRectMake(SCREEN_WIDTH-twoView.x, 44.5, (SCREEN_WIDTH-30*5)/2, 1);
    rightLineView.backgroundColor = [UIColor redColor];
    [topBackView addSubview:rightLineView];
    
    NSArray * titles = @[@"声音认证",@"身份认证",@"视频认证"];
    NSArray * subTitles = @[@"5 活跃度",@"10 活跃度",@"15 活跃度"];
    
    for (int i=0; i<3; i++)
    {
        UILabel * certifiercationLabel = [[UILabel alloc] init];
        certifiercationLabel.textColor = [UIColor blackColor];
        certifiercationLabel.font = [UIFont systemFontOfSize:12];
        certifiercationLabel.textAlignment = NSTextAlignmentCenter;
        certifiercationLabel.text = [NSString stringWithFormat:@"%@",[titles objectAtIndex:i]];
        [topBackView addSubview:certifiercationLabel];
        
        UILabel * certifiercationSubLabel = [[UILabel alloc] init];
        certifiercationSubLabel.textColor = [UIColor redColor];
        certifiercationSubLabel.font = [UIFont systemFontOfSize:12];
        certifiercationSubLabel.textAlignment = NSTextAlignmentCenter;
        certifiercationSubLabel.text = [NSString stringWithFormat:@"%@",[subTitles objectAtIndex:i]];
        [topBackView addSubview:certifiercationSubLabel];
        
        if (i==0)
        {
            certifiercationLabel.frame = CGRectMake(15+(SCREEN_WIDTH/3+10)*i, 80, 60, 16);
            certifiercationSubLabel.frame = CGRectMake(15+(SCREEN_WIDTH/3+10)*i, 100, 60, 16);
        }
        if (i==1)
        {
            certifiercationLabel.frame = CGRectMake(SCREEN_WIDTH/2-30, 80, 60, 16);
            certifiercationSubLabel.frame = CGRectMake(SCREEN_WIDTH/2-30, 100, 60, 16);
        }
        if (i==2)
        {
            certifiercationLabel.frame = CGRectMake(SCREEN_WIDTH-76, 80, 60, 16);
            certifiercationSubLabel.frame = CGRectMake(SCREEN_WIDTH-76, 100, 60, 16);
        }
    }
    
    
//    //声音认证
//    UIView * bottomBackView = [[UIView alloc] init];
//    bottomBackView.backgroundColor = [UIColor whiteColor];
//    bottomBackView.frame = CGRectMake(0, topBackView.y+topBackView.height+10, SCREEN_WIDTH, SCREEN_HEIGHT-64-140);
//    [self.view addSubview:bottomBackView];
//    
//    UILabel * bottomTopTitle = [[UILabel alloc] init];
//    bottomTopTitle.frame = CGRectMake(0, 30, SCREEN_WIDTH, 16);
//    bottomTopTitle.text = @"按钮下方按钮，10秒内依次朗读以下数字";
//    bottomTopTitle.textAlignment = NSTextAlignmentCenter;
//    bottomTopTitle.textColor = [UIColor grayColor];
//    bottomTopTitle.font = [UIFont systemFontOfSize:14];
//    [bottomBackView addSubview:bottomTopTitle];
//    
//    UIButton * voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    voiceBtn.layer.cornerRadius = 45;
//    voiceBtn.layer.masksToBounds = YES;
//    voiceBtn.frame = CGRectMake(bottomBackView.width/2-45, bottomBackView.height-200, 90, 90);
//    [voiceBtn setBackgroundImage:[UIImage imageNamed:@"录音"] forState:UIControlStateNormal];
//    [bottomBackView addSubview:voiceBtn];
    
    //身份认证
    UIView * bottomBackView = [[UIView alloc] init];
    bottomBackView.backgroundColor = [UIColor whiteColor];
    bottomBackView.frame = CGRectMake(0, topBackView.y+topBackView.height+10, SCREEN_WIDTH, SCREEN_HEIGHT-64-140);
    [self.view addSubview:bottomBackView];
    
    UILabel * bottomTopTitle = [[UILabel alloc] init];
    bottomTopTitle.frame = CGRectMake(0, 20, SCREEN_WIDTH, 16);
//    bottomTopTitle.text = @"请您手持身份证拍摄一张您与身份证的合照，如下图";
    bottomTopTitle.text = @"录制一段5-10秒的清晰自我视频";
    bottomTopTitle.textAlignment = NSTextAlignmentCenter;
    bottomTopTitle.textColor = [UIColor grayColor];
    bottomTopTitle.font = [UIFont systemFontOfSize:14];
    [bottomBackView addSubview:bottomTopTitle];

//    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"身份图片"]];
//    imageView.frame = CGRectMake(10, bottomTopTitle.y+bottomTopTitle.height+20, SCREEN_WIDTH-20, 246*(SCREEN_WIDTH-20)/300);
//    [imageView setImage:[UIImage imageNamed:@"身份图片"]];
//    [bottomBackView addSubview:imageView];
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"身份图片"]];
    imageView.frame = CGRectMake(10, bottomTopTitle.y+bottomTopTitle.height+10, SCREEN_WIDTH-20, 246*(SCREEN_WIDTH-20)/300);
    [imageView setImage:[UIImage imageNamed:@"视频照片"]];
    [bottomBackView addSubview:imageView];
    
    UIButton * cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cameraBtn.layer.cornerRadius = 10;
    cameraBtn.layer.masksToBounds = YES;
    [cameraBtn setTitle:@"拍照" forState:UIControlStateNormal];
    cameraBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [cameraBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cameraBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    cameraBtn.frame = CGRectMake(10, bottomBackView.height-65, 100, 40);
    cameraBtn.backgroundColor = [UIColor redColor];
    [bottomBackView addSubview:cameraBtn];
    
    UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.layer.cornerRadius = 10;
    submitBtn.layer.masksToBounds = YES;
    [submitBtn setTitle:@"提交认证" forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    submitBtn.frame = CGRectMake(bottomBackView.width-110, bottomBackView.height-65, 100, 40);
    submitBtn.backgroundColor = MintGreenColor;
    [bottomBackView addSubview:submitBtn];
    
}

- (void)UserCertificationNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
