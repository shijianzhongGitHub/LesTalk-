//
//  GPEventCell.m
//  GPHandMade
//
//  Created by dandan on 16/6/27.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "GPEventCell.h"
#import "GPEventData.h"
#import "UIImageView+WebCache.h"

@interface GPEventCell()
@property (strong, nonatomic) UILabel *eventLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *statusLabel;
/** 地址 */
@property (nonatomic, strong) UILabel * addressLabel;
@property (strong, nonatomic) UIImageView *contentImageView;

@end
@implementation GPEventCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.contentView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 210)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
        
        UIImageView * contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 106)];
        [backView addSubview:contentImageView];
        self.contentImageView = contentImageView;
        
        UILabel * eventLavel = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, SCREEN_WIDTH/2, 30)];
        eventLavel.layer.cornerRadius = 10;
        eventLavel.font = [UIFont systemFontOfSize:12];
        [backView addSubview:eventLavel];
        self.eventLabel = eventLavel;
        
        UILabel * timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, SCREEN_WIDTH, 30)];
        [backView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel = timeLabel;
        
        UILabel * statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-100, 130, 80, 30)];
        [backView addSubview:statusLabel];
        statusLabel.layer.cornerRadius = 15;
        statusLabel.layer.masksToBounds = YES;
        statusLabel.backgroundColor = MintGreenColor;
        statusLabel.textAlignment = NSTextAlignmentCenter;
        statusLabel.font = [UIFont systemFontOfSize:12];
        statusLabel.textColor = [UIColor blackColor];
        self.statusLabel = statusLabel;
        
        UILabel * addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, SCREEN_WIDTH/2, 30)];
        [backView addSubview:addressLabel];
        addressLabel.text = @"北京通州土桥地铁附近235号";
        addressLabel.font = [UIFont systemFontOfSize:12];
        self.addressLabel = addressLabel;
    }
    
    return self;
}

- (void)setEventData:(GPEventData *)eventData
{
    _eventData = eventData;
    NSURL *contUrl = [NSURL URLWithString:eventData.m_logo];
    [self.contentImageView sd_setImageWithURL:contUrl placeholderImage:[UIImage imageNamed:@"2"]];
    self.timeLabel.text = [NSString stringWithFormat:@"征集作品时间:%@",eventData.c_time];
    self.eventLabel.text = eventData.c_name;
    if ([eventData.c_status isEqualToString:@"1"]) {
        self.statusLabel.text = @"我要报名";
        self.statusLabel.font = [UIFont systemFontOfSize:12];
    }else{
        self.statusLabel.text = @"打开阅读";
        self.statusLabel.font = [UIFont systemFontOfSize:12];
    }
}
@end
