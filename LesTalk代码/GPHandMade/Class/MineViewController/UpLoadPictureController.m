//
//  UpLoadPictureController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/1.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "UpLoadPictureController.h"
#import "MyNavigationView.h"

@interface UpLoadPictureController ()
{
    MyNavigationView * navView;
    UITableView      * mainTableView;
}

@end

@implementation UpLoadPictureController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"上传图片" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:@"保存" andSEL:@selector(upLoadPictureNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    for (int i = 0; i<3; i++)
    {
        UIImageView * upLoadImageView = [[UIImageView alloc] init];
        upLoadImageView.frame = CGRectMake((60+5)*i, 64, 60, 60);
        upLoadImageView.image = [UIImage imageNamed:@"资料头像"];
        [self.view addSubview:upLoadImageView];
    }
    
    UIView * bottomoView = [[UIView alloc] init];
    bottomoView.frame = CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_WIDTH, 60);
    [self.view addSubview:bottomoView];
    
    UILabel * bottomNoticeLabel = [[UILabel alloc] init];
    bottomNoticeLabel.frame = CGRectMake(0, SCREEN_HEIGHT-90, SCREEN_WIDTH, 30);
    bottomNoticeLabel.backgroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    bottomNoticeLabel.text = @"  可选择9张图片";
    bottomNoticeLabel.textAlignment = NSTextAlignmentLeft;
    bottomNoticeLabel.textColor = [UIColor whiteColor];
    bottomNoticeLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:bottomNoticeLabel];
    
    UIButton * upLoadcamaraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    upLoadcamaraBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH/3, 60);
    [upLoadcamaraBtn setTitle:@"相机胶卷" forState:UIControlStateNormal];
    upLoadcamaraBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [upLoadcamaraBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [upLoadcamaraBtn addTarget:self action:@selector(upLoadcamaraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomoView addSubview:upLoadcamaraBtn];
    
    UIButton * chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chooseBtn.frame = CGRectMake(SCREEN_WIDTH/4*3, 0, SCREEN_WIDTH/4, 60);
    [chooseBtn setTitle:@"选好了" forState:UIControlStateNormal];
    chooseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    chooseBtn.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    [chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseBtn addTarget:self action:@selector(chooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomoView addSubview:chooseBtn];
    
}

- (void)chooseBtnClick:(UIButton *)btn
{
    NSLog(@"=======chooseBtnClick=========");
}

- (void)upLoadcamaraBtnClick:(UIButton *)btn
{
    NSLog(@"=======upLoadcamaraBtnClick=========");
}

- (void)upLoadPictureNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
