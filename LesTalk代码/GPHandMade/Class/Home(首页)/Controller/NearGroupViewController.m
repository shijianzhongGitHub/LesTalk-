//
//  NearGroupViewController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/2.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "NearGroupViewController.h"

#import "GPEventData.h"
#import "GPJianDaoHeader.h"
#import "GPAutoFooter.h"
#import "GPHttpTool.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "GPSlideEventController.h"
#import "XWCoolAnimator.h"

#import "NearGroupCell.h"
#import "CreateGroupController.h"

static NSString * const EventId = @"eventCell";

@interface NearGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *eventDataS;
@property (nonatomic, copy) NSString *lastId;
/** tableView */
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation NearGroupViewController
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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
//    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    //    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GPEventCell class]) bundle:nil] forCellReuseIdentifier:EventId];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventDataS.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(10, 5, 100, 20);
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:12];
    [sectionView addSubview:titleLabel];
    
    UIButton * createGroupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    createGroupBtn.frame = CGRectMake(SCREEN_WIDTH-60, 0, 50, 30);
    createGroupBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [createGroupBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sectionView addSubview:createGroupBtn];
    
    if (section == 0)
    {
        titleLabel.text = @"活跃群组";
        [createGroupBtn setTitle:@"创建" forState:UIControlStateNormal];
        [createGroupBtn addTarget:self action:@selector(createGroupBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (section == 1)
    {
        titleLabel.text = @"附近群组";
        [createGroupBtn setTitle:@" " forState:UIControlStateNormal];
    }
    
    
    return sectionView;
}

- (void)createGroupBtnClick:(UIButton *)btn
{
    NSLog(@"=====创建群========");
    
    CreateGroupController * createGroupVc = [[CreateGroupController alloc] init];
    [self.navigationController pushViewController:createGroupVc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NearGroupCell *eventCell = [tableView dequeueReusableCellWithIdentifier:EventId];
    
    if (eventCell == nil)
    {
        eventCell = [[NearGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EventId];
    }
    
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

@end
