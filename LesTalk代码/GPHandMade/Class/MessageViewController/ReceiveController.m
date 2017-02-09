//
//  ReceiveController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/7.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "ReceiveController.h"
#import "MyNavigationView.h"
#import "ReceiveCell.h"

@interface ReceiveController ()<UITableViewDataSource,UITableViewDelegate>
{
    MyNavigationView * navView;
    UITableView      * reciveTable;
}

@end

@implementation ReceiveController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupReceiveUI];
}

- (void)setupReceiveUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"收到的玫瑰" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(ReciveNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    reciveTable = [[UITableView alloc] init];
    reciveTable.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    reciveTable.dataSource = self;
    reciveTable.delegate = self;
    [self.view addSubview:reciveTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    
    ReceiveCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ReceiveCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void)ReciveNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
