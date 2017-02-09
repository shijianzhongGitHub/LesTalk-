//
//  PersonalInformationCell.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/8.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "PersonalInformationCell.h"

@implementation PersonalInformationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * userImg = [[UIImageView alloc] init];
        userImg.frame = CGRectMake(SCREEN_WIDTH/2-30, 20, 60, 60);
        userImg.layer.cornerRadius = 30;
        userImg.layer.masksToBounds = YES;
        userImg.userInteractionEnabled = YES;
        userImg.hidden = YES;
        userImg.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:userImg];
        self.userImg = userImg;

        UIImageView * cameraImg = [[UIImageView alloc] init];
        cameraImg.frame = CGRectMake(SCREEN_WIDTH/2+5, 20, 25, 25);
        cameraImg.layer.cornerRadius = 12.5;
        cameraImg.layer.masksToBounds = YES;
        cameraImg.userInteractionEnabled = YES;
        cameraImg.hidden = YES;
        cameraImg.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:cameraImg];
        self.cameraImg = cameraImg;
        
        UILabel * leftTitleLabel = [[UILabel alloc] init];
        leftTitleLabel.frame = CGRectMake(5, 10, SCREEN_WIDTH-20, 16);
        leftTitleLabel.textColor = [UIColor blackColor];
        leftTitleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:leftTitleLabel];
        self.leftTitleLabel = leftTitleLabel;
        
        UILabel * centerTitleLabel = [[UILabel alloc] init];
        centerTitleLabel.frame = CGRectMake(5, 10, SCREEN_WIDTH-20, 16);
        centerTitleLabel.textAlignment = NSTextAlignmentCenter;
        centerTitleLabel.textColor = [UIColor blackColor];
        centerTitleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:centerTitleLabel];
        self.centerTitleLabel = centerTitleLabel;
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
