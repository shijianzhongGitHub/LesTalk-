//
//  GPEventController.m
//  GPHandMade
//
//  Created by dandan on 16/6/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "GPEventController.h"
#import "GPEventData.h"
#import "GPJianDaoHeader.h"
#import "GPAutoFooter.h"
#import "GPHttpTool.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "GPSlideEventController.h"
#import "XWCoolAnimator.h"

#import "DynamicSquareCell.h"
#import "UserCenterController.h"

NSString *EventId = @"eventCell";

@interface GPEventController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *eventDataS;
@property (nonatomic, copy) NSString *lastId;
/** tableView */
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GPEventController
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
    
    UIView * backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    CGFloat segControlW = SCREEN_WIDTH/3+60;
    CGFloat segControlH = 30;
    UISegmentedControl *segContontrol = [[UISegmentedControl alloc] initWithItems:@[@"附近动态",@"最火动态"]];
    segContontrol.frame = CGRectMake(segControlW-90, 10, segControlW, segControlH);
    segContontrol.layer.cornerRadius = 10;
    segContontrol.layer.masksToBounds = YES;

    [segContontrol setTintColor:[UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0]];
    // 设置选中的文字颜色
    [segContontrol setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    [segContontrol setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    segContontrol.selectedSegmentIndex = 0;
    [backView addSubview:segContontrol];
    
    UIButton * editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    editBtn.frame = CGRectMake(SCREEN_WIDTH-50, 5, 40, 40);
    [editBtn setImage:[UIImage imageNamed:@"发布文字"] forState:UIControlStateNormal];
    [backView addSubview:editBtn];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    [header setTitle:@"小客正在为你刷新" forState:MJRefreshStateRefreshing];
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
    return 190;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DynamicSquareCell *eventCell = [tableView dequeueReusableCellWithIdentifier:EventId];
    
    if (eventCell == nil)
    {
        eventCell = [[DynamicSquareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EventId];
    }
    
    UITapGestureRecognizer * cellUserTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userIconClick:)];
    eventCell.userIcon.tag = indexPath.row;
    [eventCell.userIcon addGestureRecognizer:cellUserTap];
    
    eventCell.eventData = self.eventDataS[indexPath.row];
    return eventCell;
}
#pragma mark - UItableView 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    GPEventData *evenDa = self.eventDataS[indexPath.row];
//    GPSlideEventController *slideVc = [[GPSlideEventController alloc]init];
//    slideVc.handId = evenDa.c_id;
//    [self.navigationController pushViewController:slideVc animated:YES];
}

- (void)userIconClick:(UITapGestureRecognizer *)tap
{
    UserCenterController * userCenterVc = [[UserCenterController alloc] init];
    [self.navigationController pushViewController:userCenterVc animated:YES];
}

@end
