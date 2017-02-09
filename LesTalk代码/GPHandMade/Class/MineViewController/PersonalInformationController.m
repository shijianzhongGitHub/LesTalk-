//
//  PersonalInformationController.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/1.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "PersonalInformationController.h"
#import "MyNavigationView.h"
#import "UpLoadPictureController.h"

@interface PersonalInformationController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * peraonalTableView;
}

@end

@implementation PersonalInformationController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"修改资料" andLeftBBIImage:[UIImage imageNamed:@"返回"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@""] andRightBBITitle:nil andSEL:@selector(personalNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
    scrollView.userInteractionEnabled = YES;
    scrollView.backgroundColor = AppBackgroupColor;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+552);
    [self.view addSubview:scrollView];

    UIImageView * userImg = [[UIImageView alloc] init];
    userImg.frame = CGRectMake(SCREEN_WIDTH/2-30, 20, 60, 60);
    userImg.layer.cornerRadius = 30;
    userImg.layer.masksToBounds = YES;
    userImg.userInteractionEnabled = YES;
    userImg.image = [UIImage imageNamed:@"头像女"];
    [scrollView addSubview:userImg];

    UIImageView * cameraImg = [[UIImageView alloc] init];
    cameraImg.frame = CGRectMake(SCREEN_WIDTH/2+5, 20, 25, 25);
    cameraImg.layer.cornerRadius = 12.5;
    cameraImg.layer.masksToBounds = YES;
    cameraImg.userInteractionEnabled = YES;
    cameraImg.backgroundColor = [UIColor cyanColor];
    [scrollView addSubview:cameraImg];

    UITapGestureRecognizer *userImgTap =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTap:)];
    UITapGestureRecognizer *cameraTap =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTap:)];

    [userImg addGestureRecognizer:userImgTap];
    [cameraImg addGestureRecognizer:cameraTap];
    
    UIView * oneView = [[UIView alloc] init];
    oneView.frame = CGRectMake(0, userImg.y+userImg.height+20, SCREEN_WIDTH, 44*5);
    oneView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:oneView];
    
    NSArray * tphArray = @[@"T",@"P",@"H"];
    
    for (int i = 0; i<3; i++)
    {
        UIButton * tphBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tphBtn.frame = CGRectMake(35+(SCREEN_WIDTH/5+30)*i, 5, SCREEN_WIDTH/5, 30);
        
        if (i==0)
        {
            tphBtn.backgroundColor = MintGreenColor;
        }
        else
        {
            tphBtn.backgroundColor = [UIColor lightGrayColor];
        }
        
        tphBtn.layer.cornerRadius = 15;
        tphBtn.layer.masksToBounds = YES;
        [tphBtn setTitle:[tphArray objectAtIndex:i] forState:UIControlStateNormal];
        [oneView addSubview:tphBtn];
    }
    
    NSArray * oneViewTitles = @[@"",@"昵称:\t图嘎哈",@"年龄:\t23",@"身高:\t180cm",@"体重:\t60kg"];
    
    for (int i=0; i<5; i++)
    {
        UILabel * leftTitleLabel = [[UILabel alloc] init];
        leftTitleLabel.frame = CGRectMake(5, 44*i, SCREEN_WIDTH-20, 44);
        leftTitleLabel.textColor = [UIColor blackColor];
        leftTitleLabel.text = [NSString stringWithFormat:@"%@",[oneViewTitles objectAtIndex:i]];
        leftTitleLabel.font = [UIFont systemFontOfSize:14];
        [oneView addSubview:leftTitleLabel];
    }
    
    UIView * twoView = [[UIView alloc] init];
    twoView.frame = CGRectMake(0, oneView.y+oneView.height+10, SCREEN_WIDTH, 44*5);
    twoView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:twoView];

    NSArray * twoViewTitles = @[@"是否单身:",@"星座:\t请选择",@"职业:\t设计师",@"常驻地:\t北京通州",@"兴趣爱好:\t羽毛球、乒乓球等"];
    
    for (int i=0; i<5; i++)
    {
        UILabel * leftTitleLabel = [[UILabel alloc] init];
        leftTitleLabel.frame = CGRectMake(5, 44*i, SCREEN_WIDTH-20, 44);
        leftTitleLabel.textColor = [UIColor blackColor];
        leftTitleLabel.text = [NSString stringWithFormat:@"%@",[twoViewTitles objectAtIndex:i]];
        leftTitleLabel.font = [UIFont systemFontOfSize:14];
        [twoView addSubview:leftTitleLabel];
    }
    
    UIView * threeView = [[UIView alloc] init];
    threeView.frame = CGRectMake(0, twoView.y+twoView.height+10, SCREEN_WIDTH, 44*5);
    threeView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:threeView];
    
    NSArray * threeViewTitles = @[@"曾经有过的地方:\t请选择",@"最喜欢的电影:\t请选择",@"最喜欢的国家:\t请选择",@"最喜欢的歌曲:\t请选择",@"最喜欢的食物:\t苹果"];
    
    for (int i=0; i<5; i++)
    {
        UILabel * leftTitleLabel = [[UILabel alloc] init];
        leftTitleLabel.frame = CGRectMake(5, 44*i, SCREEN_WIDTH-20, 44);
        leftTitleLabel.textColor = [UIColor blackColor];
        leftTitleLabel.text = [NSString stringWithFormat:@"%@",[threeViewTitles objectAtIndex:i]];
        leftTitleLabel.font = [UIFont systemFontOfSize:14];
        [threeView addSubview:leftTitleLabel];
    }
    
    UIView * fourView = [[UIView alloc] init];
    fourView.frame = CGRectMake(0, threeView.y+threeView.height+10, SCREEN_WIDTH, 44*6);
    fourView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:fourView];
    
    NSArray * fourViewTitles = @[@"",@"",@"年龄:\t",@"星座:\t请选择",@"身高:",@"体重:"];
    
    for (int i=0; i<6; i++)
    {
        UILabel * leftTitleLabel = [[UILabel alloc] init];
        leftTitleLabel.frame = CGRectMake(5, 44*i, SCREEN_WIDTH-20, 44);
        leftTitleLabel.textColor = [UIColor blackColor];
        leftTitleLabel.text = [NSString stringWithFormat:@"%@",[fourViewTitles objectAtIndex:i]];
        leftTitleLabel.font = [UIFont systemFontOfSize:14];
        [fourView addSubview:leftTitleLabel];
        
        if (i==0)
        {
            leftTitleLabel.text = @"关于你的理想型";
            leftTitleLabel.textColor = [UIColor redColor];
            leftTitleLabel.textAlignment = NSTextAlignmentCenter;
        }
        
        if (i==1)
        {
            for (int j = 0; j<3; j++)
            {
                UIButton * tphBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                tphBtn.frame = CGRectMake(35+(SCREEN_WIDTH/5+30)*j, 5+44, SCREEN_WIDTH/5, 30);
                
                if (j==0)
                {
                    tphBtn.backgroundColor = MintGreenColor;
                }
                else
                {
                    tphBtn.backgroundColor = [UIColor lightGrayColor];
                }
                
                tphBtn.layer.cornerRadius = 15;
                tphBtn.layer.masksToBounds = YES;
                [tphBtn setTitle:[tphArray objectAtIndex:j] forState:UIControlStateNormal];
                [fourView addSubview:tphBtn];
            }
        }
    }
    
    
//    peraonalTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStyleGrouped];
//    peraonalTableView.dataSource = self;
//    peraonalTableView.delegate = self;
////    peraonalTableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    [self.view addSubview:peraonalTableView];
//    // Do any additional setup after loading the view.
}

- (void)personalNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)userTap:(UITapGestureRecognizer *)tap
{
    UpLoadPictureController * upLoadPictureVc = [[UpLoadPictureController alloc] init];
    [self.navigationController pushViewController:upLoadPictureVc animated:YES];
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 4;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (section == 0)
//    {
//        return 6;
//    }
//    return 5;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 0)
//    {
//        if (indexPath.row == 0)
//        {
//            return 100;
//        }
//    }
//    else if (indexPath.section == 3)
//    {
//        if (indexPath.row == 0)
//        {
//            return 88;
//        }
//    }
//    
//    return 44;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString * cellIdentifier = @"cell";
//    
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    
//    NSArray * tphArray = @[@"T",@"P",@"H"];
//    
//    if (indexPath.section == 0)
//    {
//        if (indexPath.row == 0)
//        {
//            cell.textLabel.text = @" ";
//            UIImageView * userImg = [[UIImageView alloc] init];
//            userImg.frame = CGRectMake(SCREEN_WIDTH/2-30, 20, 60, 60);
//            userImg.layer.cornerRadius = 30;
//            userImg.layer.masksToBounds = YES;
//            userImg.userInteractionEnabled = YES;
//            userImg.backgroundColor = [UIColor redColor];
//            [cell.contentView addSubview:userImg];
//            
//            UIImageView * cameraImg = [[UIImageView alloc] init];
//            cameraImg.frame = CGRectMake(SCREEN_WIDTH/2+5, 20, 25, 25);
//            cameraImg.layer.cornerRadius = 12.5;
//            cameraImg.layer.masksToBounds = YES;
//            cameraImg.userInteractionEnabled = YES;
//            cameraImg.backgroundColor = [UIColor cyanColor];
//            [cell.contentView addSubview:cameraImg];
//            
//            UITapGestureRecognizer *userImgTap =
//            [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTap:)];
//            UITapGestureRecognizer *cameraTap =
//            [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTap:)];
//            
//            [userImg addGestureRecognizer:userImgTap];
//            [cameraImg addGestureRecognizer:cameraTap];
//            
//        }
//        else if (indexPath.row == 1)
//        {
//            cell.textLabel.text = @" ";
//            for (int i = 0; i<3; i++)
//            {
//                UIButton * tphBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//                tphBtn.frame = CGRectMake(35+(SCREEN_WIDTH/5+30)*i, 5, SCREEN_WIDTH/5, 30);
//                tphBtn.backgroundColor = [UIColor grayColor];
//                tphBtn.layer.cornerRadius = 15;
//                tphBtn.layer.masksToBounds = YES;
//                [tphBtn setTitle:[tphArray objectAtIndex:i] forState:UIControlStateNormal];
//                [cell.contentView addSubview:tphBtn];
//            }
//        }
//        
//        else if (indexPath.row == 2)
//        {
//            cell.textLabel.text = @"昵称   图嘎哈";
//        }
//        if (indexPath.row == 3)
//        {
//            cell.textLabel.text = @"年龄   23";
//        }
//        if (indexPath.row == 4)
//        {
//            cell.textLabel.text = @"身高   180cm";
//        }
//        if (indexPath.row == 5)
//        {
//            cell.textLabel.text = @"体重   60kg";
//        }
//    }
//    else if (indexPath.section == 1)
//    {
//        if (indexPath.row == 0)
//        {
//            cell.textLabel.text = @"是否单身";
//        }
//        else if (indexPath.row == 1)
//        {
//            cell.textLabel.text = @"星座   请选择";
//        }
//        else if (indexPath.row == 2)
//        {
//            cell.textLabel.text = @"职业   设计师";
//        }
//        else if (indexPath.row == 3)
//        {
//            cell.textLabel.text = @"常住地    北京通州";
//        }
//        else if (indexPath.row == 4)
//        {
//            cell.textLabel.text = @"兴趣爱好    羽毛球、乒乓球等";
//        }
//    }
//    else if (indexPath.section == 2)
//    {
//        if (indexPath.row == 0)
//        {
//            cell.textLabel.text = @"曾经游过的地方   请添加";
//        }
//        else if (indexPath.row == 1)
//        {
//            cell.textLabel.text = @"最喜欢的电影   请添加";
//        }
//        else if (indexPath.row == 2)
//        {
//            cell.textLabel.text = @"最喜欢的国家   请添加";
//        }
//        else if (indexPath.row == 3)
//        {
//            cell.textLabel.text = @"最喜欢的歌曲   请添加";
//        }
//        else if (indexPath.row == 4)
//        {
//            cell.textLabel.text = @"最喜欢的食物   请添加";
//        }
//    }
//    else if (indexPath.section == 3)
//    {
//        if (indexPath.row == 0)
//        {
//            cell.textLabel.text = @" ";
//        }
//        else if (indexPath.row == 1)
//        {
//            cell.textLabel.text = @"年龄";
//        }
//        else if (indexPath.row == 2)
//        {
//            cell.textLabel.text = @"星座   请选择";
//        }
//        else if (indexPath.row == 3)
//        {
//            cell.textLabel.text = @"身高";
//        }
//        else if (indexPath.row == 4)
//        {
//            cell.textLabel.text = @"体重";
//        }
//    }
//    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    return cell;
//}
//
////section头部间距
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0.01f;//section头部高度
//}
////section头部视图
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}
////section底部间距
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 5;
//}
////section底部视图
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}
//
//- (void)personalNavigationClick:(UIButton *)navBtn
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (void)userTap:(UITapGestureRecognizer *)tap
//{
//    UpLoadPictureController * upLoadPictureVc = [[UpLoadPictureController alloc] init];
//    [self.navigationController pushViewController:upLoadPictureVc animated:YES];
//}

@end
