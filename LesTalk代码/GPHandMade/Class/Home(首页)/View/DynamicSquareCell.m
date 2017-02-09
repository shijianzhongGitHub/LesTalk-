//
//  DynamicSquareCell.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/2.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "DynamicSquareCell.h"
#import "GPEventData.h"
#import "UIImageView+WebCache.h"

@interface DynamicSquareCell()

@property (nonatomic, strong) UILabel       * userNameLabel;
@property (nonatomic, strong) UILabel       * timeLabel;
@property (nonatomic, strong) UILabel       * contentLabel;
@property (nonatomic, strong) UIButton      * praiseBtn;//点赞
@property (nonatomic, strong) UIButton      * commentBtn;//评论

@end

@implementation DynamicSquareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        
        UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 189)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
        
        UIImageView * userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        [backView addSubview:userIcon];
        userIcon.layer.cornerRadius = 20;
        userIcon.userInteractionEnabled = YES;
        userIcon.layer.masksToBounds = YES;
        self.userIcon = userIcon;
        
        UILabel * userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 10, SCREEN_WIDTH/2, 30)];
        userNameLabel.layer.cornerRadius = 10;
        userNameLabel.text = @"安捷达";
        userNameLabel.font = [UIFont systemFontOfSize:12];
        [backView addSubview:userNameLabel];
        self.userNameLabel = userNameLabel;
        
        UILabel * timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 25, SCREEN_WIDTH, 30)];
        [backView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel = timeLabel;
        
        UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 50, SCREEN_WIDTH/2, 30)];
        [backView addSubview:contentLabel];
        contentLabel.text = @"北京通州土桥地铁附近235号";
        contentLabel.font = [UIFont systemFontOfSize:12];
        self.contentLabel = contentLabel;
        
        UIImageView * cellImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10+userIcon.width+15, contentLabel.y+contentLabel.height+5, SCREEN_WIDTH-20-userIcon.width-15, 70)];
        [backView addSubview:cellImgView];
        cellImgView.userInteractionEnabled = YES;
        cellImgView.image = [UIImage imageNamed:@"photo"];
        self.cellImgView = cellImgView;
        
        UIButton * praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-105, 165, 15, 15)];
        [backView addSubview:praiseBtn];
        praiseBtn.titleLabel.text = @"点赞";
        [praiseBtn setBackgroundImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        praiseBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        praiseBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.praiseBtn = praiseBtn;
        
        UIButton * commentBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-50, 165, 15, 15)];
        [backView addSubview:commentBtn];
        commentBtn.titleLabel.text = @"评论";
        [commentBtn setBackgroundImage:[UIImage imageNamed:@"评论-(2)"] forState:UIControlStateNormal];
        commentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        commentBtn.titleLabel.textColor = [UIColor blackColor];
        self.commentBtn = commentBtn;
    }
    
    return self;
}

- (void)setEventData:(GPEventData *)eventData
{
    _eventData = eventData;
    NSURL *contUrl = [NSURL URLWithString:eventData.m_logo];
    [self.userIcon sd_setImageWithURL:contUrl placeholderImage:[UIImage imageNamed:@"2"]];
    self.timeLabel.text = [NSString stringWithFormat:@"%@",eventData.c_time];
    self.contentLabel.text = eventData.c_name;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
