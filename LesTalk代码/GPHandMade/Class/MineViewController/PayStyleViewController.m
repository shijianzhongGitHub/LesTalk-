//
//  PayStyleViewController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/5.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "PayStyleViewController.h"
#import "MyNavigationView.h"

@interface PayStyleViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * payTableView;
}

@end

@implementation PayStyleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = AppBackgroupColor;
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"支付方式" andLeftBBIImage:[UIImage imageNamed:@""] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(payStyleNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    payTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    payTableView.dataSource = self;
    payTableView.delegate = self;
    [self.view addSubview:payTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"appstore支付";
        cell.imageView.image = [UIImage imageNamed:@"as"];
    }
    else if (indexPath.row == 0)
    {
        cell.textLabel.text = @"微信支付";
        cell.imageView.image = [UIImage imageNamed:@"微信"];
    }
    else if (indexPath.row == 0)
    {
        cell.textLabel.text = @"支付宝支付";
        cell.imageView.image = [UIImage imageNamed:@"支付宝"];
    }
    
    return cell;
}

- (void)payStyleNavigationClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
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
