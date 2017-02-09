//
//  GPDarenCell.m
//  GPHandMade
//
//  Created by dandan on 16/6/23.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "GPDarenCell.h"
#import "GPDaData.h"
#import "UIImageView+WebCache.h"

@interface GPDarenCell()
@property (strong, nonatomic) UIButton *guanBtn;

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;
@property (strong, nonatomic) UILabel *ageLabel;
@property (strong, nonatomic) UILabel *distanceLabel;
@property (strong, nonatomic) UIImageView *oneImageView;
@property (strong, nonatomic) UIImageView *twoImageView;
@property (strong, nonatomic) UIImageView *threeImageView;
@property (nonatomic, strong) NSMutableArray *picArray;
@property (nonatomic, strong) NSMutableArray *handArray;
@end

@implementation GPDarenCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.iconImageView = [[UIImageView alloc] init];
        self.iconImageView.frame = CGRectMake(0, 0, 60 , 60);
//        [self.contentView addSubview:self.iconImageView];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.frame = CGRectMake(80, 0, 100, 30);
//        [self.contentView addSubview:self.nameLabel];
        
        self.subTitleLabel = [[UILabel alloc] init];
        self.subTitleLabel.frame = CGRectMake(80, 40, 100, 30);
//        [self.contentView addSubview:self.subTitleLabel];
        
        self.oneImageView = [[UIImageView alloc] init];
        self.oneImageView.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width/3-8 , [UIScreen mainScreen].bounds.size.width/3-8);
        [self.contentView addSubview:self.oneImageView];
        
        self.ageLabel = [[UILabel alloc] init];
        self.ageLabel.frame = CGRectMake(5, self.oneImageView.frame.size.height-30, self.oneImageView.frame.size.width/2 , 30);
        self.ageLabel.text = @"20岁";
        self.ageLabel.font = [UIFont systemFontOfSize:12];
        [self.oneImageView addSubview:self.ageLabel];
        
        self.distanceLabel = [[UILabel alloc] init];
        self.distanceLabel.frame = CGRectMake(60, self.oneImageView.height-30, self.oneImageView.frame.size.width/2 , 30);
        self.distanceLabel.text = @"0.11km";
        self.distanceLabel.font = [UIFont systemFontOfSize:12];
        [self.oneImageView addSubview:self.distanceLabel];

        
        self.twoImageView = [[UIImageView alloc] init];
        self.twoImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/3+2, 10, [UIScreen mainScreen].bounds.size.width/3-8 , [UIScreen mainScreen].bounds.size.width/3-8);
        [self.contentView addSubview:self.twoImageView];
        
        self.ageLabel = [[UILabel alloc] init];
        self.ageLabel.frame = CGRectMake(5, self.twoImageView.frame.size.height-30, self.twoImageView.frame.size.width/2 , 30);
        self.ageLabel.text = @"20岁";
        self.ageLabel.font = [UIFont systemFontOfSize:12];
        [self.twoImageView addSubview:self.ageLabel];
        
        self.distanceLabel = [[UILabel alloc] init];
        self.distanceLabel.frame = CGRectMake(60, self.twoImageView.height-30, self.twoImageView.frame.size.width/2 , 30);
        self.distanceLabel.text = @"0.11km";
        self.distanceLabel.font = [UIFont systemFontOfSize:12];
        [self.twoImageView addSubview:self.distanceLabel];
        
        self.threeImageView = [[UIImageView alloc] init];
        self.threeImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/3*2+5, 10, [UIScreen mainScreen].bounds.size.width/3-5 , [UIScreen mainScreen].bounds.size.width/3-8);
        [self.contentView addSubview:self.threeImageView];
        
        self.ageLabel = [[UILabel alloc] init];
        self.ageLabel.frame = CGRectMake(5, self.threeImageView.height-30, self.threeImageView.frame.size.width/2 , 30);
        self.ageLabel.text = @"20岁";
        self.ageLabel.font = [UIFont systemFontOfSize:12];
        [self.threeImageView addSubview:self.ageLabel];
        
        self.distanceLabel = [[UILabel alloc] init];
        self.distanceLabel.frame = CGRectMake(60, self.threeImageView.frame.size.height-30, self.threeImageView.frame.size.width/2 , 30);
        self.distanceLabel.text = @"0.11km";
        self.distanceLabel.font = [UIFont systemFontOfSize:12];
        [self.threeImageView addSubview:self.distanceLabel];
        
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
//    self.picArray = @[self.oneImageView,self.twoImageView,self.threeImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
//    self.picArray = @[self.oneImageView,self.twoImageView,self.threeImageView];
    
    // Configure the view for the selected state
}

#pragma mark - 懒加载
- (NSMutableArray *)handArray
{
    if (!_handArray) {
        
        _handArray = [[NSMutableArray alloc] init];
    }
    return _handArray;
}
- (void)guanBtnClick:(UIButton *)sender {
    sender.selected = YES;
    self.guanBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;

}
- (void)setDaData:(GPDaData *)daData
{
    _daData = daData;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.guanBtn.layer.cornerRadius = 5;
    self.guanBtn.layer.borderWidth = 1;
    if (self.guanBtn.selected != YES) {
        self.guanBtn.selected = NO;
        self.guanBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    }
    self.iconImageView.layer.cornerRadius = 25;
    self.iconImageView.layer.masksToBounds = YES;
    
    NSURL *iconUrl = [NSURL URLWithString:daData.avatar];
    [self.iconImageView sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"1"]];
    [self.oneImageView sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"1"]];
    [self.twoImageView sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"1"]];
    [self.threeImageView sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"1"]];
    self.nameLabel.text = daData.nick_name;
    NSString *subStr = [NSString stringWithFormat:@"%@图文教程|%@视频教程|%@手工圈",daData.course_count,daData.video_count,daData.opus_count];
    self.subTitleLabel.text = subStr;
    
//    self.picArray = [NSMutableArray arrayWithObjects:self.oneImageView,self.twoImageView,self.threeImageView, nil];
    
//    int i = 0;
//    for (NSDictionary *picDic in daData.list) {
//        [self addImage:picDic[@"host_pic"] imageView:self.picArray[i] tag:picDic[@"hand_id"]];
//        [self addTapGestuer:self.picArray[i]];
//        i ++;
//    }
}
#pragma mark - 内部方法
- (void)addImage:(NSString *)picUrl imageView:(UIImageView *)imageView tag:(NSString *)tapStr
{
    [imageView sd_setImageWithURL:[NSURL URLWithString:picUrl] placeholderImage:[UIImage imageNamed:@"2"]];
    imageView.tag = [tapStr intValue];
}
#pragma mark - 添加手势
- (void)addTapGestuer:(UIImageView *)imageView
{
    UITapGestureRecognizer *tapGs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewClick:)];
    [imageView addGestureRecognizer:tapGs];
}
- (void)imageViewClick:(UITapGestureRecognizer *)gestureRecognizer
{
    UIImageView *imageView = (UIImageView *)[gestureRecognizer view];
    if (self.imageClick) {
        self.imageClick(imageView.tag);
    }
}

@end
