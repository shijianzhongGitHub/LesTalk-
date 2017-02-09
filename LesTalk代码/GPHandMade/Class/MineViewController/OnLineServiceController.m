//
//  OnLineServiceController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/3.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "OnLineServiceController.h"
#import "MyNavigationView.h"

@interface OnLineServiceController ()
{
    MyNavigationView * navView;
}

@end

@implementation OnLineServiceController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"在线客服" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(OnLineNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIButton * onlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    onlineBtn.frame = CGRectMake(SCREEN_WIDTH-90, SCREEN_HEIGHT-44, 80, 30);
    onlineBtn.backgroundColor = MintGreenColor;
    onlineBtn.layer.cornerRadius = 6;
    [onlineBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [onlineBtn setTitle:@"联系客服" forState:UIControlStateNormal];
    onlineBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:onlineBtn];
}

- (void)OnLineNavigationClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
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
