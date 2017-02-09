//
//  MyGroupCell.m
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/8.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "MyGroupCell.h"

@implementation MyGroupCell

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
        userName.frame = CGRectMake(userImg.x+userImg.width+5, 15, 100, 16);
        userName.textColor = [UIColor blackColor];
        userName.font = [UIFont systemFontOfSize:12];
        userName.text = @"快乐交友群";
        [self.contentView addSubview:userName];
        
        UILabel * sendLabel = [[UILabel alloc] init];
        sendLabel.frame = CGRectMake(userImg.x+userImg.width+5, 35, SCREEN_WIDTH-userImg.x-userImg.width-5, 16);
        sendLabel.textColor = [UIColor grayColor];
        sendLabel.font = [UIFont systemFontOfSize:12];
        sendLabel.text = @"多家银行却悄然上调了ATM机跨行取款的手续费。";
        [self.contentView addSubview:sendLabel];
        
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
