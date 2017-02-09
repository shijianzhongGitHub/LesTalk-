


#import "SJUserCenterController.h"

#import "SJDynamicHeadView.h"

#import "SignUpInfoController.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define HEAD_HEIGHT 235.0
#define NAV_HEIGHT 64.0

@interface SJUserCenterController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) SJDynamicHeadView *headView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) CGFloat lastOffset;

@property (nonatomic, assign) BOOL isShowWave;

@end

@implementation SJUserCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDatas];
    [self setupViews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark 数据初始化
- (void)setupDatas
{
    self.lastOffset = HEAD_HEIGHT;
}

#pragma mark 视图初始化
- (void)setupViews
{
    // tableView
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-44) style:(UITableViewStyleGrouped)];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID_Cell"];
        
        self.tableView.contentInset = UIEdgeInsetsMake(HEAD_HEIGHT, 0, 0, 0);
        [self.view addSubview:self.tableView];
    }

    // self.headView
    {
        self.headView = [[SJDynamicHeadView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, HEAD_HEIGHT)];
        self.headView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:self.headView];
    }
    // bottom btn
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44)];
    bottomView.backgroundColor = MintGreenColor;
    [self.view addSubview:bottomView];
    
    UIButton * bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBtn.frame = CGRectMake(10, 7, SCREEN_WIDTH-20, 30);
    bottomBtn.backgroundColor = [UIColor whiteColor];
    [bottomBtn setTitle:@"我也要评论" forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [bottomBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [bottomView addSubview:bottomBtn];
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 25, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"返回2"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            return 88;
        }
            break;
        case 1:
        {
            return 88+44;
        }
            break;
        case 2:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    return 30;
                }
                    break;
                default:
                {
                    return 44*3;
                }
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (0 == indexPath.section)
    {
        UIView * cellbackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 88)];
        [cell.contentView addSubview:cellbackView];
        
        UILabel * topTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, SCREEN_WIDTH/2, 14)];
        topTitleLabel.text = @"一起观赏艺术园林";
        topTitleLabel.textColor = [UIColor blackColor];
        topTitleLabel.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:topTitleLabel];
        
        UIButton * signUpBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-90, 15, 80, 30)];
        [signUpBtn setTitle:@"我要报名" forState:UIControlStateNormal];
        signUpBtn.backgroundColor = MintGreenColor;
        signUpBtn.layer.cornerRadius = 15;
        signUpBtn.layer.masksToBounds = YES;
        [signUpBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        signUpBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [signUpBtn addTarget:self action:@selector(signUpBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:signUpBtn];
        
        UILabel * timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, SCREEN_WIDTH/2, 14)];
        timeLabel.text = @"2016-11-11";
        timeLabel.textColor = [UIColor grayColor];
        timeLabel.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:timeLabel];
        
        UILabel * addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, SCREEN_WIDTH/2, 14)];
        addressLabel.text = @"北京通州土桥附近235号";
        addressLabel.textColor = [UIColor grayColor];
        addressLabel.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:addressLabel];
        
        
    }
    else if (1 == indexPath.section)
    {
        UIView * cellbackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 88)];
        [cell.contentView addSubview:cellbackView];
        
        UILabel * topTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, SCREEN_WIDTH/2, 14)];
        topTitleLabel.text = @"一起观赏艺术园林";
        topTitleLabel.textColor = [UIColor blackColor];
        topTitleLabel.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:topTitleLabel];
        
        UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, SCREEN_WIDTH-10, 60)];
        contentLabel.text = @"大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友大家一起交朋友";
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = [UIColor grayColor];
        contentLabel.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:contentLabel];
        
        UIButton * upMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 100, 60, 25)];
        [upMenuBtn setTitle:@"展开" forState:UIControlStateNormal];
        [upMenuBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        upMenuBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:upMenuBtn];
    }
    else if (2 == indexPath.section)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                cell.textLabel.text = @"全部评论(555)";
            }
                break;
            default:
            {
                UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44*3)];
                backView.backgroundColor = [UIColor whiteColor];
                [cell.contentView addSubview:backView];
                
                UIImageView * userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 40, 40)];
                [userIcon setImage:[UIImage imageNamed:@"头像"]];
                userIcon.layer.cornerRadius = 20;
                userIcon.layer.masksToBounds = YES;
                [backView addSubview:userIcon];
                
                UILabel * userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 10, SCREEN_WIDTH/2, 30)];
                userNameLabel.layer.cornerRadius = 10;
                userNameLabel.text = @"安捷达";
                userNameLabel.font = [UIFont systemFontOfSize:12];
                [backView addSubview:userNameLabel];
                
                UILabel * timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 25, SCREEN_WIDTH, 30)];
                [backView addSubview:timeLabel];
                timeLabel.font = [UIFont systemFontOfSize:12];
                timeLabel.text = @"2016-11-11";
                
                UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 50, SCREEN_WIDTH-userIcon.width-35, 80)];
                [backView addSubview:contentLabel];
                contentLabel.text = @"上传代码的童鞋将会获得50金钱，管理员会及时审核代码，如果代码审核通过额外奖励100金钱,如果优秀内容被加精华再奖励200金钱，感谢你们对code4app的支持.";
                contentLabel.numberOfLines = 0;
                contentLabel.font = [UIFont systemFontOfSize:12];
            }
                break;
        }
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   
    if (self.isShowWave) {
         [self.headView.waveView starWave];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
     CGFloat offsetY = scrollView.contentOffset.y;
    
    if (fabs(offsetY) > HEAD_HEIGHT) {
        self.isShowWave = YES;
    }
    else {
        self.isShowWave = NO;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.headView.waveView stopWave];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // contentOffset.y 为负值
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat height = HEAD_HEIGHT - (self.lastOffset + offsetY);

    if (height < NAV_HEIGHT)
    {
        height = NAV_HEIGHT;
        self.headView.navBar.alpha = 1;
    }
    else
    {
        self.headView.navBar.alpha = 1 - height / HEAD_HEIGHT;
    }

    self.headView.frame  = CGRectMake(0, 0, self.headView.frame.size.width, height);
    self.headView.imgView.frame = CGRectMake(0, 0, self.headView.frame.size.width, height);
}

- (void)signUpBtnClick:(UIButton *)btn
{
    SignUpInfoController * signUpVc = [[SignUpInfoController alloc] init];
    [self.navigationController pushViewController:signUpVc animated:YES];
}

- (void)backClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
