//
//  GPFeaturedController.m
//  GPHandMade
//
//  Created by dandan on 16/6/4.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "GPFeaturedController.h"

#import "GPEventData.h"
#import "GPJianDaoHeader.h"
#import "GPAutoFooter.h"
#import "GPHttpTool.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "GPSlideEventController.h"
#import "XWCoolAnimator.h"

#import "NearGroupCell.h"
NSString *EventId = @"eventCell";

@interface GPFeaturedController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *eventDataS;
@property (nonatomic, copy) NSString *lastId;
/** tableView */
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GPFeaturedController
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
    params[@"id"] = @"45763834376";
    
    // 2.发起请求
    [GPHttpTool get:@"http://youhui.tongtaibao.com/index.php/admin/userinfo/shi.php" params:params success:^(id responseObj) {
        
        NSLog(@"========responseObj=====%@",responseObj);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"失败了,赶紧跑"];
    }];
    
    /*
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
     }];*/
}
#pragma mark - UItableView 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventDataS.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
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
    GPEventData *evenDa = self.eventDataS[indexPath.row];
    GPSlideEventController *slideVc = [[GPSlideEventController alloc]init];
    slideVc.handId = evenDa.c_id;
    [self.navigationController pushViewController:slideVc animated:YES];
}

@end

/*
@implementation GPFeaturedController
- (void)viewDidLoad {
    [super viewDidLoad];
    //测试接口
    [self testInterface];
    
    // 设置导航栏
    [self configNav];
    // 加载数据
    [self loadData];
    // 注册 cell
    [self regisCell];
}
#pragma mark - 懒加载
- (NSMutableArray *)dataSlideArray
{
    if (!_dataSlideArray) {
        
        _dataSlideArray = [[NSMutableArray alloc] init];
    }
    return _dataSlideArray;
}
- (NSMutableArray *)dataHotArray
{
    if (!_dataHotArray) {
        
        _dataHotArray = [[NSMutableArray alloc] init];
    }
    return _dataHotArray;
}
- (NSMutableArray *)dataSlideS
{
    if (!_dataSlideS) {
        
        _dataSlideS = [[NSMutableArray alloc] init];
    }
    return _dataSlideS;
}
- (NSMutableArray *)dataAdvanceArray
{
    if (!_dataAdvanceArray) {
        
        _dataAdvanceArray = [[NSMutableArray alloc] init];
    }
    return _dataAdvanceArray;
}
- (NSMutableArray *)dataNavigationArray
{
    if (!_dataNavigationArray) {
        
        _dataNavigationArray = [[NSMutableArray alloc] init];
    }
    return _dataNavigationArray;
}
#pragma mark - 初始化方法
- (instancetype)init
{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}
- (void)configNav
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, GPTabBarH, 0);

}

- (void)regisCell
{    // 注册 cell
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GPNavigationCell class]) bundle:nil]forCellWithReuseIdentifier:GPNavigation];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GPAdvanceCell class]) bundle:nil] forCellWithReuseIdentifier:GPAdvance];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GPHotCell class]) bundle:nil] forCellWithReuseIdentifier:GPHot];
    // 注册 headView
    [self.collectionView registerClass:[GPSlideHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:GPSlideHead];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GPSectionHeadView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:GPSectionHead];
}
#pragma mark - 数据处理
- (void)loadData
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
    // 设置header
    self.collectionView.mj_header = header;
}

- (void)testInterface
{
    // 1.添加参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"id"] = @"45763834376";

    NSString * urlString = @"http://youhui.tongtaibao.com/admin/userinfo/shi/?&id=45763834376";
    
    // 2.发起请求
    [GPHttpTool get:urlString params:nil success:^(id responseObj) {
        
        NSLog(@"========responseObj =========%@ ",responseObj);
        
    } failure:^(NSError *error) {
        
        NSLog(@"error=======%@",error);
        
    }];
}

-(void)loadNewData
{

    // 1.添加参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"index";
    params[@"a"] = @"indexNewest";
    params[@"vid"] = @"18";
    
    __weak typeof(self) weakSelf = self;
    [self.dataSlideS removeAllObjects];
    [self.dataHotArray removeAllObjects];
    [self.dataSlideArray removeAllObjects];
    [self.dataNavigationArray removeAllObjects];
    [self.dataAdvanceArray removeAllObjects];
    // 2.发起请求
    [GPHttpTool get:HomeBaseURl params:params success:^(id responseObj) {
        // 字典转模型
        self.data = [GPData mj_objectWithKeyValues:responseObj[@"data"]];
        // 轮播图数组
        for (GPslide *slide in self.data.slide) {
            [weakSelf.dataSlideArray addObject:slide.host_pic];
            [weakSelf.dataSlideS addObject:slide];
        }
        // 添加轮播图
        [self AddSDCycleView];
        // 热帖数组
        for (GPHotData *hotData in self.data.hotTopic) {
            [weakSelf.dataHotArray addObject:hotData];
        }
        // 图标数组
        for (GPNavigationData *navigationData in self.data.navigation) {
            [weakSelf.dataNavigationArray addObject:navigationData];
        }
        [weakSelf.dataNavigationArray addObject:[self addQianDaoData]];
        // 推荐数组
        for (GPAdvanceData *advanceData in self.data.advance) {
            [weakSelf.dataAdvanceArray addObject:advanceData];
        }
        [weakSelf.collectionView.mj_header endRefreshing];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [weakSelf.collectionView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"失败了,再来一次"];
    }];
    
}
// 添加签到模型
- (GPNavigationData *)addQianDaoData
{
    GPNavigationData *QianDaoData = [[GPNavigationData alloc]init];
    QianDaoData.pic = @"http://image.shougongke.com/app/index/navigation/appIndexNav12.png";
    QianDaoData.name = @"签到";
    return QianDaoData;
    
}
#pragma mark - 内部方法
- (void)AddSDCycleView
{
    // 创建轮播图
    CGFloat cycleX = 0;
    CGFloat cycleY = 0;
    CGFloat cycleW = SCREEN_WIDTH;
    CGFloat cycleH = SCREEN_HEIGHT * 0.25;
    CGRect rect = CGRectMake(cycleX, cycleY, cycleW, cycleH);
    SDCycleScrollView *cycleScorllView = [SDCycleScrollView cycleScrollViewWithFrame:rect delegate:self placeholderImage:[UIImage imageNamed:@"2"]];
    self.cycleScorllView = cycleScorllView;
    self.cycleScorllView.imageURLStringsGroup = self.dataSlideArray;
}
#pragma mark - 轮播图的代理
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    GPslide *slide = self.dataSlideS[index];
    if ([slide.itemtype isEqualToString: @"class_special"] || [slide.itemtype isEqualToString:@"topic_detail_h5"]) {
        GPWebViewController *webVC = [UIStoryboard storyboardWithName:NSStringFromClass([GPWebViewController class]) bundle:nil].instantiateInitialViewController;
        webVC.slide = slide;
        [self.navigationController pushViewController:webVC animated:YES];
    }else if([slide.itemtype isEqualToString: @"event"]){
        GPSlideEventController *slideVC = [[GPSlideEventController alloc]init];
        slideVC.slide = slide;
        [self.navigationController pushViewController:slideVC animated:YES];
    }else if ([slide.itemtype isEqualToString:@"web_out"]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:slide.hand_id]];
    }
    else{
        GPSlideLessonController *lessVc = [[GPSlideLessonController alloc]init];
        lessVc.slideData = slide;
        [self.navigationController pushViewController:lessVc animated:YES];
    }
}
#pragma mark - UIcollectionView 布局
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CGFloat W = SCREEN_WIDTH / (self.dataNavigationArray.count + 0.8);
        return CGSizeMake(W, W);
    }else if(indexPath.section == 1)
    {
        return CGSizeMake(SCREEN_WIDTH * 0.48,SCREEN_WIDTH * 0.4);
    }else{
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.5);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

#pragma mark - UICollectionView 代理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
         XWCoolAnimator *animator = [XWCoolAnimator xw_animatorWithType:XWCoolTransitionAnimatorTypePortal];
        GPMainWebController *webVc = [UIStoryboard storyboardWithName:NSStringFromClass([GPMainWebController class]) bundle:nil].instantiateInitialViewController;
        webVc.hotData = self.dataHotArray[indexPath.row];
        [self xw_presentViewController:webVc withAnimator:animator];
    }else if (indexPath.section == 0){
        if (indexPath.row == 2) {
            GPWebViewController *webVc = [UIStoryboard storyboardWithName:NSStringFromClass([GPWebViewController class]) bundle:nil].instantiateInitialViewController;
            webVc.navigatioanData = self.dataNavigationArray[indexPath.row];
            [self.navigationController pushViewController:webVc animated:YES];
        }else if (indexPath.row == 3){
            XWCoolAnimator *animator = [XWCoolAnimator xw_animatorWithType:XWCoolTransitionAnimatorTypeExplode];
            GPLoginController *logVc = [UIStoryboard storyboardWithName:NSStringFromClass([GPLoginController class]) bundle:nil].instantiateInitialViewController;
            [self xw_presentViewController:logVc withAnimator:animator];
        }else if (indexPath.row == 1){
            GPChatController *chatVc = [[GPChatController alloc]init];
            XWDrawerAnimator *animator = [XWDrawerAnimator xw_animatorWithDirection:XWDrawerAnimatorDirectionBottom moveDistance:SCREEN_HEIGHT * 0.8];
            animator.flipEnable = YES;
            [self xw_presentViewController:chatVc withAnimator:animator];
        }else{
            GPTabBarController *tabVc = [[GPTabBarController alloc]init];
            tabVc.selectedIndex = 1;
            [UIApplication sharedApplication].keyWindow.rootViewController = tabVc;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            GPTopicListController *topListVc = [[GPTopicListController alloc]init];
            [self.navigationController pushViewController:topListVc animated:YES];
        }else{
            GPTabBarController *tabVc = [[GPTabBarController alloc]init];
            tabVc.selectedIndex = 1;
            [UIApplication sharedApplication].keyWindow.rootViewController = tabVc;
        }
    }
}
#pragma mark - UIcollectionView 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return NumberSection;;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.dataNavigationArray.count;
    }else if (section == 1){
        return  self.dataAdvanceArray.count;
    }else{
        return  self.dataHotArray.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        GPNavigationCell *navgationCell = [collectionView dequeueReusableCellWithReuseIdentifier:GPNavigation forIndexPath:indexPath];
        navgationCell.navgationData = self.dataNavigationArray[indexPath.row];
        return navgationCell;
    }else if(indexPath.section == 1){
        GPAdvanceCell *advanceCell = [collectionView dequeueReusableCellWithReuseIdentifier:GPAdvance forIndexPath:indexPath];
        advanceCell.advanceData = self.dataAdvanceArray[indexPath.row];
        return advanceCell;
    }else{
        GPHotCell *hotCell = [collectionView dequeueReusableCellWithReuseIdentifier:GPHot forIndexPath:indexPath];
        hotCell.hotdata = self.dataHotArray[indexPath.row];
        return hotCell;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headView = nil;
    if (indexPath.section == 0) {
        headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:GPSlideHead forIndexPath:indexPath];
        [headView addSubview:self.cycleScorllView];
    }else if (indexPath.section == 2){
        headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:GPSectionHead forIndexPath:indexPath];
    }
      return headView;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeZero;
    if (section == 0) {
         size = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT *0.25);
    }else if (section == 2){
        size = CGSizeMake(SCREEN_WIDTH, GPTitlesViewH);
    }
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    CATransform3D rotation;//3D旋转
//    rotation = CATransform3DMakeTranslation(0 ,50 ,20);
            rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
    //逆时针旋转
    
    rotation = CATransform3DScale(rotation, 0.8, 0.8, 1);
    
    rotation.m34 = 1.0/ 1000;
    
    cell.layer.shadowColor = [[UIColor redColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    
    [UIView beginAnimations:@"rotation" context:NULL];
    //旋转时间
    [UIView setAnimationDuration:0.6];
    
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}
@end
 */
