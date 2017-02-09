//
//  MessageViewController.m
//  LesTalk
//
//  Created by 史建忠 on 2016/10/27.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "MessageViewController.h"
#import "MyNavigationView.h"
#import "WriteDynamicController.h"
#import "ReceiveController.h"
#import "MyGroupController.h"
#import "MyFriendsController.h"


@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MyNavigationView * navView;
    UITableView      * messageTableView;
}

@end

@implementation MessageViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [self setupMessageUI];
}

- (void)setupMessageUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"消息" andLeftBBIImage:[UIImage imageNamed:@""] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(MessageNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    messageTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-76) style:UITableViewStyleGrouped];
    messageTableView.dataSource = self;
    messageTableView.delegate = self;
    //    mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:messageTableView];
    
    
    UIView * noticeBackView = [[UIView alloc] init];
    noticeBackView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT+44);
    noticeBackView.backgroundColor = [UIColor colorWithRed:126/255.0 green:26/255.0 blue:26/255.0 alpha:0.6];
    [self.view addSubview:noticeBackView];
    self.noticeBackView = noticeBackView;
    
    
    UIScrollView * noticeScrollView = [[UIScrollView alloc] init];
    noticeScrollView.frame = CGRectMake(10, 130, SCREEN_WIDTH-20, 220);
    noticeScrollView.pagingEnabled = YES;
    noticeScrollView.showsHorizontalScrollIndicator = NO;
    noticeScrollView.backgroundColor = [UIColor clearColor];
    noticeScrollView.contentSize = CGSizeMake((SCREEN_WIDTH-20)*2, 200);
    [noticeBackView addSubview:noticeScrollView];
    self.noticeScrollView = noticeScrollView;
    
    UIView * coverWhiteViewOne = [[UIView alloc] init];
    coverWhiteViewOne.frame = CGRectMake(0, 0, SCREEN_WIDTH-20, 200);
    coverWhiteViewOne.backgroundColor = [UIColor whiteColor];
    [noticeScrollView addSubview:coverWhiteViewOne];
    
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, noticeScrollView.y+noticeScrollView.height-20, SCREEN_WIDTH-20, 20);
    pageControl.numberOfPages = 2;
    pageControl.currentPage = 0;
    pageControl.defersCurrentPageDisplay = YES;
    [pageControl updateCurrentPageDisplay];
    [noticeBackView addSubview:pageControl];
    
//    UIImageView * smileImageView = [[UIImageView alloc] init];
//    smileImageView.frame = CGRectMake(20, 15, 30, 30);
//    smileImageView.backgroundColor = [UIColor redColor];
//    [smileImageView setImage:[UIImage imageNamed:@""]];
//    [coverWhiteView addSubview:smileImageView];
    
    UILabel * oneLabel = [[UILabel alloc] init];
    oneLabel.frame = CGRectMake(20, 25, 20, 20);
    oneLabel.text = @"1";
    oneLabel.layer.cornerRadius = 10;
    oneLabel.layer.masksToBounds = YES;
    oneLabel.textAlignment = NSTextAlignmentCenter;
    oneLabel.font = [UIFont boldSystemFontOfSize:14];
    oneLabel.textColor = [UIColor whiteColor];
    oneLabel.backgroundColor = [UIColor redColor];
    [coverWhiteViewOne addSubview:oneLabel];
    
    UILabel * noticeLabel = [[UILabel alloc] init];
    noticeLabel.frame = CGRectMake(20+oneLabel.width+10, 20, 150, 30);
    noticeLabel.text = @"完善资料";
//    noticeLabel.text = @"给LesTalk评分";
    noticeLabel.textColor = [UIColor blackColor];
    [coverWhiteViewOne addSubview:noticeLabel];
    
    
    UILabel * subNoticeLabel = [[UILabel alloc] init];
    subNoticeLabel.frame = CGRectMake(20, 50, SCREEN_WIDTH-40, 60);
    subNoticeLabel.text = @"完善资料方便系统更好的为您匹配到志同道合的那个她！";
//    subNoticeLabel.text = @"LesTalk需要你的关心你的爱，请给\n五个星好评吧~";
    subNoticeLabel.numberOfLines = 0;
    subNoticeLabel.textColor = [UIColor grayColor];
    [coverWhiteViewOne addSubview:subNoticeLabel];
    
    UIButton * scoreCloseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    scoreCloseBtn.frame = CGRectMake(20, coverWhiteViewOne.height-80, SCREEN_WIDTH/3, 35);
    [scoreCloseBtn setTitle:@"跳过" forState:UIControlStateNormal];
    scoreCloseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [scoreCloseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    scoreCloseBtn.backgroundColor = [UIColor colorWithRed:134/255.0 green:134/255.0 blue:134/255.0 alpha:1.0];
    [scoreCloseBtn addTarget:self action:@selector(scoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [coverWhiteViewOne addSubview:scoreCloseBtn];
    
    UIButton * scoreCommentsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    scoreCommentsBtn.frame = CGRectMake(SCREEN_WIDTH-40-SCREEN_WIDTH/3, coverWhiteViewOne.height-80, SCREEN_WIDTH/3, 35);
    //    [scoreCommentsBtn setTitle:@"跳过" forState:UIControlStateNormal];
    [scoreCommentsBtn setTitle:@"完善资料" forState:UIControlStateNormal];
    scoreCommentsBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [scoreCommentsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    scoreCommentsBtn.backgroundColor = [UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0];
    [coverWhiteViewOne addSubview:scoreCommentsBtn];
    
    UIButton * noRemindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noRemindBtn.frame = CGRectMake(0, coverWhiteViewOne.height-35, SCREEN_WIDTH-20, 30);
    [noRemindBtn setTitle:@"*您也可以选择稍后在个人中心修改资料中完善" forState:UIControlStateNormal];
//    [noRemindBtn setTitle:@"马上认证" forState:UIControlStateNormal];
    noRemindBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [noRemindBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    noRemindBtn.backgroundColor = [UIColor clearColor];
    [coverWhiteViewOne addSubview:noRemindBtn];
    
    
    UIView * coverWhiteViewTwo = [[UIView alloc] init];
    coverWhiteViewTwo.frame = CGRectMake(SCREEN_WIDTH-20, 0, SCREEN_WIDTH-20, 200);
    coverWhiteViewTwo.backgroundColor = [UIColor whiteColor];
    [noticeScrollView addSubview:coverWhiteViewTwo];
    
    UILabel * twoLabel = [[UILabel alloc] init];
    twoLabel.frame = CGRectMake(20, 25, 20, 20);
    twoLabel.text = @"2";
    twoLabel.layer.cornerRadius = 10;
    twoLabel.layer.masksToBounds = YES;
    twoLabel.textAlignment = NSTextAlignmentCenter;
    twoLabel.font = [UIFont boldSystemFontOfSize:14];
    twoLabel.textColor = [UIColor whiteColor];
    twoLabel.backgroundColor = [UIColor redColor];
    [coverWhiteViewTwo addSubview:twoLabel];
    
    UILabel * noticeLabelTwo = [[UILabel alloc] init];
    noticeLabelTwo.frame = CGRectMake(20+oneLabel.width+10, 20, 150, 30);
    noticeLabelTwo.text = @"用户认证";
    //    noticeLabelTwo.text = @"给LesTalk评分";
    noticeLabelTwo.textColor = [UIColor blackColor];
    [coverWhiteViewTwo addSubview:noticeLabelTwo];
    
    UILabel * subNoticeLabelTwo = [[UILabel alloc] init];
    subNoticeLabelTwo.frame = CGRectMake(20, 50, SCREEN_WIDTH-40, 60);
    subNoticeLabelTwo.text = @"认证后才能使用LesTalk的全部功能哦！";
    //    subNoticeLabelTwo.text = @"LesTalk需要你的关心你的爱，请给\n五个星好评吧~";
    subNoticeLabelTwo.numberOfLines = 0;
    subNoticeLabelTwo.textColor = [UIColor grayColor];
    [coverWhiteViewTwo addSubview:subNoticeLabelTwo];
    
    UIButton * scoreCloseBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    scoreCloseBtnTwo.frame = CGRectMake(20, coverWhiteViewOne.height-80, SCREEN_WIDTH/3, 35);
    [scoreCloseBtnTwo setTitle:@"跳过" forState:UIControlStateNormal];
    scoreCloseBtnTwo.titleLabel.font = [UIFont systemFontOfSize:14];
    [scoreCloseBtnTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    scoreCloseBtnTwo.backgroundColor = [UIColor colorWithRed:134/255.0 green:134/255.0 blue:134/255.0 alpha:1.0];
    [scoreCloseBtnTwo addTarget:self action:@selector(scoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [coverWhiteViewTwo addSubview:scoreCloseBtnTwo];
    
    UIButton * scoreCommentsBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    scoreCommentsBtnTwo.frame = CGRectMake(SCREEN_WIDTH-40-SCREEN_WIDTH/3, coverWhiteViewOne.height-80, SCREEN_WIDTH/3, 35);
    [scoreCommentsBtnTwo setTitle:@"马上认证" forState:UIControlStateNormal];
    scoreCommentsBtnTwo.titleLabel.font = [UIFont systemFontOfSize:14];
    [scoreCommentsBtnTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    scoreCommentsBtnTwo.backgroundColor = [UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0];
    [coverWhiteViewTwo addSubview:scoreCommentsBtnTwo];
    
    UIButton * noRemindBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    noRemindBtnTwo.frame = CGRectMake(0, coverWhiteViewOne.height-35, SCREEN_WIDTH-20, 30);
    [noRemindBtnTwo setTitle:@"*您也可以选择稍后在个人中心用户认证中认证" forState:UIControlStateNormal];
    noRemindBtnTwo.titleLabel.font = [UIFont systemFontOfSize:12];
    [noRemindBtnTwo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    noRemindBtnTwo.backgroundColor = [UIColor clearColor];
    [coverWhiteViewTwo addSubview:noRemindBtnTwo];
}

- (void)scoreBtnClick:(UIButton *)btn
{
    [self.noticeBackView removeFromSuperview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    else if (section == 1)
    {
        return 3;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"好友";
            cell.imageView.image = [UIImage imageNamed:@"好友"];
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"群组";
            cell.imageView.image = [UIImage imageNamed:@"群组"];
        }
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"帅帅";
            cell.imageView.image = [UIImage imageNamed:@"好友"];
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"系统消息";
            cell.imageView.image = [UIImage imageNamed:@"系统消息"];
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"安捷达";
            cell.imageView.image = [UIImage imageNamed:@"好友"];
        }
    }
 
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            MyFriendsController * myFriendsVc = [[MyFriendsController alloc] init];
            myFriendsVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myFriendsVc animated:YES];
        }
        
        else if (indexPath.row == 1)
        {
            MyGroupController * myGroupVc = [[MyGroupController alloc] init];
            myGroupVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myGroupVc animated:YES];
        }
    }
    
//    ReceiveController * receiveVc = [[ReceiveController alloc] init];
//    receiveVc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:receiveVc animated:YES];
    
//    WriteDynamicController * writeDynamicVc = [[WriteDynamicController alloc] init];
//    writeDynamicVc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:writeDynamicVc animated:YES];
}

//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;//section头部高度
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)MessageNavigationClick:(UIButton *)btn
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
