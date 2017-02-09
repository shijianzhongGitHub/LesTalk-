


#import "UserCenterController.h"

#import "SJDynamicHeadView.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define HEAD_HEIGHT 235.0
#define NAV_HEIGHT 64.0

@interface UserCenterController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) SJDynamicHeadView *headView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) CGFloat lastOffset;

@property (nonatomic, assign) BOOL isShowWave;

@property (nonatomic, strong) UIView * topView;
@property (nonatomic, strong) UIImageView * userImgView;
@property (nonatomic, strong) UIImageView  * bouncedImageView;
@property (nonatomic, strong) UIView * usrInforBackView;


@property (nonatomic, assign) NSInteger x;

@end

@implementation UserCenterController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.x = 1;
    [self setupDatas];
    [self setupViews];
    
}

- (void)didReceiveMemoryWarning
{
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
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-44)];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID_Cell"];
        self.tableView.contentInset = UIEdgeInsetsMake(HEAD_HEIGHT, 0, 0, 0);
        [self.view addSubview:self.tableView];
    }

    // self.headView
    {
        self.headView = [[SJDynamicHeadView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, HEAD_HEIGHT)];
        [self.view addSubview:self.headView];
        
        self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, HEAD_HEIGHT)];
        self.topView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.topView];
        
        UIImageView * userImgView = [[UIImageView alloc] init];
        userImgView.frame = CGRectMake(SCREEN_WIDTH/2-10, 50, 54, 54);
        [userImgView setImage:[UIImage imageNamed:@"头像"]];
        userImgView.layer.cornerRadius = 27;
        userImgView.layer.masksToBounds = YES;
        [self.topView addSubview:userImgView];
        
//        UIImageView * userImgView = [[UIImageView alloc] init];
//        userImgView.frame = CGRectMake(SCREEN_WIDTH/2-27, 50, 54, 54);
//        [userImgView setImage:[UIImage imageNamed:@"头像"]];
//        userImgView.layer.cornerRadius = 27;
//        userImgView.layer.masksToBounds = YES;
//        [self.topView addSubview:userImgView];
        
        UIImageView * userloveImgView = [[UIImageView alloc] init];
        userloveImgView.frame = CGRectMake(SCREEN_WIDTH/2-46, 50, 54, 54);
        [userloveImgView setImage:[UIImage imageNamed:@"头像女"]];
        userloveImgView.layer.cornerRadius = 27;
        userloveImgView.layer.masksToBounds = YES;
        [self.topView addSubview:userloveImgView];
        
        UILabel * userNamelabel = [[UILabel alloc] init];
        userNamelabel.frame = CGRectMake(0, 110, SCREEN_WIDTH, 20);
        userNamelabel.text = @"爱仕达";
        userNamelabel.textAlignment = NSTextAlignmentCenter;
        userNamelabel.font = [UIFont systemFontOfSize:14];
        userNamelabel.textColor = [UIColor whiteColor];
        [self.topView addSubview:userNamelabel];
        
        UILabel * loveTimelabel = [[UILabel alloc] init];
        loveTimelabel.frame = CGRectMake(0, 130, SCREEN_WIDTH, 20);
        loveTimelabel.text = @"和爱江山恋爱了235天";
        loveTimelabel.textAlignment = NSTextAlignmentCenter;
        loveTimelabel.font = [UIFont systemFontOfSize:13];
        loveTimelabel.textColor = [UIColor whiteColor];
        [self.topView addSubview:loveTimelabel];
        
        UILabel * roseLabel = [[UILabel alloc] init];
        roseLabel.frame = CGRectMake(0, 155, SCREEN_WIDTH/2, 60);
        roseLabel.text = @"55555\n喜欢";
        roseLabel.numberOfLines = 2;
        roseLabel.textAlignment = NSTextAlignmentCenter;
        roseLabel.textColor = [UIColor whiteColor];
        [self.topView addSubview:roseLabel];
        
        UILabel * likeLabel = [[UILabel alloc] init];
        likeLabel.frame = CGRectMake(SCREEN_WIDTH/2, 155, SCREEN_WIDTH/2, 60);
        likeLabel.text = @"55555\n喜欢";
        likeLabel.numberOfLines = 2;
        likeLabel.textAlignment = NSTextAlignmentCenter;
        likeLabel.textColor = [UIColor whiteColor];
        [self.topView addSubview:likeLabel];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(SCREEN_WIDTH/2, 170, 0.5, 30);
        lineView.backgroundColor = [UIColor whiteColor];
        [self.topView addSubview:lineView];
        
        UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addBtn.frame = CGRectMake(30, 210, SCREEN_WIDTH-60, 30);
        addBtn.layer.cornerRadius = 16;
        addBtn.layer.masksToBounds = YES;
        addBtn.layer.borderWidth = 0.8;
        [addBtn setTitle:@"+好友" forState:UIControlStateNormal];
        addBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        addBtn.titleLabel.textColor = [UIColor whiteColor];
        addBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
        [self.topView addSubview:addBtn];
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
    
    UIButton * moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(SCREEN_WIDTH-45, 25, 30, 30);
    [moreBtn setImage:[UIImage imageNamed:@"更多按钮"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moreBtn];
    
    UIView * btnBackView = [[UIView alloc] init];
    btnBackView.frame = CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44);
    btnBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnBackView];
    
    UIImageView  * bouncedImageView = [[UIImageView alloc] init];
    bouncedImageView.frame = CGRectMake(SCREEN_WIDTH-65, 55, 65, 80);
    [bouncedImageView setImage:[UIImage imageNamed:@"弹出框"]];
    bouncedImageView.hidden = YES;
    bouncedImageView.userInteractionEnabled = YES;
    [self.view addSubview:bouncedImageView];
    self.bouncedImageView = bouncedImageView;
    
    //举报
    UIButton * reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reportBtn.frame = CGRectMake(0, 2, 65, 40);
    [reportBtn setTitle:@"举报" forState:UIControlStateNormal];
    reportBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [reportBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reportBtn addTarget:self action:@selector(reportBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bouncedImageView addSubview:reportBtn];
    
    //拉黑
    UIButton * shieldingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shieldingBtn.frame = CGRectMake(0, 42, 65, 40);
    [shieldingBtn setTitle:@"拉黑" forState:UIControlStateNormal];
    shieldingBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [shieldingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shieldingBtn addTarget:self action:@selector(shieldingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bouncedImageView addSubview:shieldingBtn];
    
    UIView * lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, 44.5, 65, 0.5);
    lineView.backgroundColor = [UIColor colorWithRed:169/255.0 green:219/255.0 blue:204/255.0 alpha:1.0];
    [bouncedImageView addSubview:lineView];
    
    NSArray * btnTitles = @[@"聊天",@"送她玫瑰",@"资料"];
    NSArray * btnImages = @[@"",@"",@""];
    
    for (int i = 0; i<3; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(SCREEN_WIDTH/3*i, 0, SCREEN_WIDTH/3, 44);
        [btn setTitle:[btnTitles objectAtIndex:i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.tag = i;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[btnImages objectAtIndex:i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnBackView addSubview:btn];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake((SCREEN_WIDTH/3-0.5)*i-1, 16, 1.0, 12);
        lineView.backgroundColor = [UIColor grayColor];
        [btnBackView addSubview:lineView];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (SCREEN_WIDTH-40)/3+10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    for (int i = 0; i<3; i++)
    {
        UIImageView * userImg = [[UIImageView alloc] init];
        userImg.frame = CGRectMake(10+((SCREEN_WIDTH-40)/3+10)*i, 10, (SCREEN_WIDTH-40)/3, (SCREEN_WIDTH-40)/3);
        [userImg setImage:[UIImage imageNamed:@"头像"]];
        [cell.contentView addSubview:userImg];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.isShowWave)
    {
         [self.headView.waveView starWave];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
     CGFloat offsetY = scrollView.contentOffset.y;
    
    if (fabs(offsetY) > HEAD_HEIGHT)
    {
        self.isShowWave = YES;
    }
    else {
        self.isShowWave = NO;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
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
        self.topView.alpha = 0.0;
    }
    else
    {
        self.headView.navBar.alpha = 1 - height / HEAD_HEIGHT;
        self.topView.alpha = 1.0;
    }

    self.headView.frame  = CGRectMake(0, 0, self.headView.frame.size.width, height);
    self.headView.imgView.frame = CGRectMake(0, 0, self.headView.frame.size.width, height);
    self.topView.frame = CGRectMake(0, height-HEAD_HEIGHT+self.userImgView.height-20, [UIScreen mainScreen].bounds.size.width, HEAD_HEIGHT);
}

- (void)bottomBtnClick:(UIButton *)btn
{
    switch (btn.tag)
    {
        case 0:
        {
            NSLog(@"=======聊天=======");
            
        }
            break;
        case 1:
        {
            NSLog(@"=======送她玫瑰=======");
        }
            break;
        case 2:
        {
            NSLog(@"=======资料=======");
            
            NSArray * titleString = @[@"特质倾向:",@"年    \t   龄:",@"星    \t   座:",@"是否单身:",@"身    \t   高:",@"体    \t   重:",@"职    \t   业:",@"居住地点:",@"兴趣爱好:" ];
            NSArray * titleInforString = @[@"\tT",@"\t23",@"\t白羊座",@"\t是",@"\t167CM",@"\t50KG",@"\t空姐",@"\t北京通州",@"\t大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好" ];
            
            UIView * usrInforBackView = [[UIView alloc] init];
            usrInforBackView.frame = CGRectMake(10, 150, SCREEN_WIDTH-20, SCREEN_HEIGHT-220);
            usrInforBackView.backgroundColor = MintGreenColor;
            usrInforBackView.layer.cornerRadius = 20;
            usrInforBackView.layer.masksToBounds = YES;
            [self.view addSubview:usrInforBackView];
            self.usrInforBackView = usrInforBackView;
            
            UIButton  * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            closeBtn.frame = CGRectMake(usrInforBackView.width-40, 10, 30, 30);
            [closeBtn setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
            [closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [usrInforBackView addSubview:closeBtn];
            
            for (int i=0; i<9; i++)
            {
                UILabel * inforLabel = [[UILabel alloc] init];
                inforLabel.frame = CGRectMake(10, 60+(35*i), usrInforBackView.width-20, 30);
                inforLabel.font = [UIFont systemFontOfSize:12];
                inforLabel.textColor = [UIColor blackColor];
                inforLabel.text = [NSString stringWithFormat:@"%@%@",[titleString objectAtIndex:i],[titleInforString objectAtIndex:i]];
                [usrInforBackView addSubview:inforLabel];
                
                if (i==8)
                {
                    inforLabel.numberOfLines = 0;
                    inforLabel.height = 60;
                }
            }
            
        }
            break;
            
        default:
            break;
    }
}

- (void)closeBtnClick:(UIButton *)btn
{
    [self.usrInforBackView removeFromSuperview];
}

- (void)backClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)moreBtnClick:(UIButton *)btn
{
    if (self.x == 1)
    {
        self.bouncedImageView.hidden = NO;
        self.x = 2;
        return;
    }
    if (self.x == 2)
    {
        self.bouncedImageView.hidden = YES;
        self.x = 1;
        return;
    }
}

- (void)reportBtnClick:(UIButton *)btn
{
    NSLog(@"========举报========");
}

- (void)shieldingBtnClick:(UIButton *)btn
{
    NSLog(@"========拉黑========");
}

@end
