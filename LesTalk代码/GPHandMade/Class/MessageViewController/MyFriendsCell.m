//
//  MyFriendsCell.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/8.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "MyFriendsCell.h"

@implementation MyFriendsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * userImg = [[UIImageView alloc] init];
        userImg.frame = CGRectMake(10, 15, 35, 35);
        userImg.layer.cornerRadius = 35/2;
        userImg.layer.masksToBounds = YES;
        userImg.image = [UIImage imageNamed:@"头像"];
        [self.contentView addSubview:userImg];
        
        UILabel * userName = [[UILabel alloc] init];
        userName.frame = CGRectMake(userImg.x+userImg.width+5, userImg.y+userImg.height/4, 100, 16);
        userName.textColor = [UIColor blackColor];
        userName.font = [UIFont systemFontOfSize:12];
        userName.text = @"萌萌哒";
        [self.contentView addSubview:userName];
        
        UIImageView * roseImg = [[UIImageView alloc] init];
        roseImg.frame = CGRectMake(SCREEN_WIDTH-40, 15, 30, 30);
        roseImg.layer.cornerRadius = 35/2;
        roseImg.layer.masksToBounds = YES;
        roseImg.userInteractionEnabled = YES;
        [self.contentView addSubview:roseImg];
        self.roseImg = roseImg;
        
        UIButton * roseBtn = [[UIButton alloc] init];
        roseBtn.frame = CGRectMake(SCREEN_WIDTH-40, 15, 30, 30);
        roseBtn.layer.cornerRadius = 35/2;
        roseBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:roseBtn];
        self.roseBtn = roseBtn;
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
