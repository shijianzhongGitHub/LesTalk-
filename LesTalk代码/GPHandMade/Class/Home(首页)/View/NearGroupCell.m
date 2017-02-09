//
//  NearGroupCell.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/2.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "NearGroupCell.h"

#import "GPEventData.h"
#import "UIImageView+WebCache.h"

@interface NearGroupCell()

@property (nonatomic, strong) UIImageView   * userIcon;
@property (nonatomic, strong) UILabel       * userNameLabel;
@property (nonatomic, strong) UILabel       * timeLabel;
@property (nonatomic, strong) UILabel       * contentLabel;
@property (nonatomic, strong) UIButton      * praiseBtn;//点赞
@property (nonatomic, strong) UIButton      * commentBtn;//评论

@end

@implementation NearGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        
        UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 89)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
        
        UIImageView * userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
        [backView addSubview:userIcon];
        userIcon.layer.cornerRadius = 25;
        userIcon.layer.masksToBounds = YES;
        self.userIcon = userIcon;
        
        UILabel * userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 15, SCREEN_WIDTH/2, 30)];
        userNameLabel.layer.cornerRadius = 10;
        userNameLabel.text = @"安捷达";
        userNameLabel.font = [UIFont systemFontOfSize:12];
        [backView addSubview:userNameLabel];
        self.userNameLabel = userNameLabel;
        
        UILabel * timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 10, 100, 30)];
        [backView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel = timeLabel;
        
//        UIButton * praiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 80, 30, 30)];
//        [backView addSubview:praiseBtn];
//        praiseBtn.titleLabel.text = @"点赞";
//        praiseBtn.backgroundColor = MintGreenColor;
//        praiseBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        praiseBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//        self.praiseBtn = praiseBtn;
//        
//        UIButton * commentBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-120, 80, 30, 30)];
//        [backView addSubview:commentBtn];
//        commentBtn.titleLabel.text = @"评论";
//        commentBtn.backgroundColor = MintGreenColor;
//        commentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//        commentBtn.titleLabel.textColor = [UIColor blackColor];
//        self.commentBtn = commentBtn;
        
        UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+userIcon.width+15, 45, SCREEN_WIDTH/2, 30)];
        [backView addSubview:contentLabel];
        contentLabel.text = @"北京通州土桥地铁附近235号";
        contentLabel.font = [UIFont systemFontOfSize:12];
        self.contentLabel = contentLabel;
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


@end
