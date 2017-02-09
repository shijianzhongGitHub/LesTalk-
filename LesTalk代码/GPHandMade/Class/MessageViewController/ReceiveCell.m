//
//  ReceiveCell.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/7.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "ReceiveCell.h"

@implementation ReceiveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * userImg = [[UIImageView alloc] init];
        userImg.frame = CGRectMake(10, 5, 35, 35);
        userImg.layer.cornerRadius = 35/2;
        userImg.layer.masksToBounds = YES;
        userImg.image = [UIImage imageNamed:@"头像"];
        [self.contentView addSubview:userImg];
        
        UILabel * userName = [[UILabel alloc] init];
        userName.frame = CGRectMake(userImg.x+userImg.width+5, 5, 100, 16);
        userName.textColor = [UIColor blackColor];
        userName.font = [UIFont systemFontOfSize:12];
        userName.text = @"萌萌哒";
        [self.contentView addSubview:userName];
        
        UILabel * sendLabel = [[UILabel alloc] init];
        sendLabel.frame = CGRectMake(userImg.x+userImg.width+5, 25, 160, 16);
        sendLabel.textColor = [UIColor grayColor];
        sendLabel.font = [UIFont systemFontOfSize:12];
        sendLabel.text = [NSString stringWithFormat:@"送出玫瑰:%ld🌹",random()];
        [self.contentView addSubview:sendLabel];
        
        UIImageView * roseImg = [[UIImageView alloc] init];
        roseImg.frame = CGRectMake(SCREEN_WIDTH-40, 5, 30, 30);
        roseImg.layer.cornerRadius = 35/2;
        roseImg.layer.masksToBounds = YES;
        roseImg.image = [UIImage imageNamed:@"玫瑰"];
        [self.contentView addSubview:roseImg];
        
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
