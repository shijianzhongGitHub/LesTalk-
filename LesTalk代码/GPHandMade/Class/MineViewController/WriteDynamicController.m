//
//  WriteDynamicController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/5.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "WriteDynamicController.h"
#import "MyNavigationView.h"

@interface WriteDynamicController ()
{
    MyNavigationView * navView;
    UITextView       * dynamicTextView;
    UIButton         * cellBtn;
    UIView           * cellMenuView;
    
    NSInteger  x;
}

@end

@implementation WriteDynamicController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"写动态" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(writeDynamicNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    // Do any additional setup after loading the view.
    
    x = 1;
    
    dynamicTextView = [[UITextView alloc] init];
    dynamicTextView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 170);
    dynamicTextView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:dynamicTextView];
    
    cellBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cellBtn.frame = CGRectMake(0, dynamicTextView.y+dynamicTextView.height+10, SCREEN_WIDTH, 43);
    [cellBtn setTitle:@"所有人可见" forState:UIControlStateNormal];
    cellBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [cellBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, SCREEN_WIDTH-120, 0, 0)];
    [cellBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cellBtn.backgroundColor = [UIColor whiteColor];
    [cellBtn addTarget:self action:@selector(cellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cellBtn];
    
    cellMenuView = [[UIView alloc] init];
    cellMenuView.frame = CGRectMake(SCREEN_WIDTH-100, cellBtn.y+cellBtn.height, 100, 80);
    cellMenuView.backgroundColor = [UIColor whiteColor];
    cellMenuView.hidden = YES;
    [self.view addSubview:cellMenuView];
    
    UIButton * allSeebtn = [[UIButton alloc] init];
    allSeebtn.frame = CGRectMake(0, 0, cellMenuView.width, cellMenuView.height/2);
    [allSeebtn setTitle:@"所有人可见" forState:UIControlStateNormal];
    [allSeebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    allSeebtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [allSeebtn addTarget:self action:@selector(allSeeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cellMenuView addSubview:allSeebtn];
    
    UIButton * friendsSeebtn = [[UIButton alloc] init];
    friendsSeebtn.frame = CGRectMake(0, cellMenuView.height/2, cellMenuView.width, cellMenuView.height/2);
    [friendsSeebtn setTitle:@"仅朋友可见" forState:UIControlStateNormal];
    [friendsSeebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    friendsSeebtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [friendsSeebtn addTarget:self action:@selector(friendsSeeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cellMenuView addSubview:friendsSeebtn];
    
    UIView * line = [[UIView alloc] init];
    line.frame = CGRectMake(0, cellMenuView.height/2, cellMenuView.width, 0.5);
    line.backgroundColor = AppBackgroupColor;
    [cellMenuView addSubview:line];
    
    UIButton * completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    completeBtn.frame = CGRectMake(10, SCREEN_HEIGHT-150, SCREEN_WIDTH-20, 35);
    completeBtn.layer.cornerRadius = 6;
    completeBtn.layer.masksToBounds = YES;
    [completeBtn setTitle:@"发布" forState:UIControlStateNormal];
    completeBtn.backgroundColor = MintGreenColor;
    [completeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:completeBtn];
}

- (void)cellBtnClick:(UIButton *)btn
{
    if (x == 1)
    {
        cellMenuView.hidden = NO;
        x = 2;
        return;
    }
    if (x == 2)
    {
        cellMenuView.hidden = YES;
        x = 1;
        return;
    }
}

- (void)allSeeBtnClick:(UIButton *)btn
{
    [cellBtn setTitle:@"所有人可见" forState:UIControlStateNormal];
    cellMenuView.hidden = YES;
}

- (void)friendsSeeBtnClick:(UIButton *)btn
{
    [cellBtn setTitle:@"仅朋友可见" forState:UIControlStateNormal];
    cellMenuView.hidden = YES;
}

- (void)writeDynamicNavigationClick:(UIButton *)navBtn
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
