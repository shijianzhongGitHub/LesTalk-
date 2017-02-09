//
//  GPEventController.m
//  GPHandMade
//
//  Created by dandan on 16/6/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "HotInformationController.h"
#import "GPEventData.h"
#import "GPEventCell.h"
#import "GPJianDaoHeader.h"
#import "GPAutoFooter.h"
#import "GPHttpTool.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "GPSlideEventController.h"
#import "XWCoolAnimator.h"

#import "SJUserCenterController.h"

static NSString * const EventId = @"eventCell";

@interface HotInformationController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *eventDataS;
@property (nonatomic, copy) NSString *lastId;
/** tableView */
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation HotInformationController
#pragma mark - 懒加载
- (NSMutableArray *)eventDataS
{
    if (!_eventDataS) {
        
        _eventDataS = [[NSMutableArray alloc] init];
    }
    return _eventDataS;
}
#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    [self regisCell];
    [self loadData];
}
- (void)regisCell
{
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];    
}

- (void)loadData
{
    // 添加下拉刷新
    GPJianDaoHeader *Header = [self addRefreshHead];
    self.tableView.mj_header = Header;
    // 添加上拉刷新
    self.tableView.mj_footer = [GPAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
- (GPJianDaoHeader *)addRefreshHead
{
    // 添加下拉刷新
    GPJianDaoHeader *header = [GPJianDaoHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.automaticallyChangeAlpha = YES;
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 设置文字
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在为你刷新" forState:MJRefreshStateRefreshing];
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    // 设置颜色
    header.stateLabel.textColor = [UIColor  darkGrayColor];
    // 马上进入刷新状态
    [header beginRefreshing];
    return  header;
}

- (void)loadNewData
{
    // 1.添加参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Course";
    params[@"a"] = @"activityList";
    params[@"vid"] = @"18";
    __weak typeof(self) weakSelf = self;
        // 2.发起请求
    [GPHttpTool get:HomeBaseURl params:params success:^(id responseObj) {
        
        weakSelf.eventDataS = [GPEventData mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        GPEventData *eventData = [weakSelf.eventDataS lastObject];
        weakSelf.lastId = eventData.id;
        [self.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [weakSelf.tableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"失败了,赶紧跑"];
        NSLog(@"%@",error);
    }];
    
}
- (void)loadMoreData
{
    // 1.添加参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Course";
    params[@"a"] = @"activityList";
    params[@"vid"] = @"18";
    params[@"id"] = self.lastId;
    __weak typeof(self) weakSelf = self;
    
    // 2.发起请求
    [GPHttpTool get:HomeBaseURl params:params success:^(id responseObj) {
        
        NSArray *moreNewArray = [GPEventData mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        
        GPEventData *eventData = [moreNewArray lastObject];
        self.lastId = eventData.id;
        
        [weakSelf.eventDataS addObjectsFromArray:moreNewArray];
        [self.tableView reloadData];
        [weakSelf.tableView.mj_footer endRefreshing];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"失败了,赶紧跑"];
    }];
}
#pragma mark - UItableView 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventDataS.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPEventCell *eventCell = [tableView dequeueReusableCellWithIdentifier:EventId];
    
    if (eventCell == nil)
    {
        eventCell = [[GPEventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EventId];
    }
    
    eventCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    eventCell.eventData = self.eventDataS[indexPath.row];
    return eventCell;
}
#pragma mark - UItableView 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJUserCenterController * signUpVc = [[SJUserCenterController alloc] init];
    [self.navigationController pushViewController:signUpVc animated:YES];
    
    
//    GPEventData *evenDa = self.eventDataS[indexPath.row];
//    GPSlideEventController *slideVc = [[GPSlideEventController alloc]init];
//    slideVc.handId = evenDa.c_id;
//    [self.navigationController pushViewController:slideVc animated:YES];
}

@end
