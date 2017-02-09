//
//  DynamicSquareCell.h
//  GPHandMade
//
//  Created by 史建忠 on 2016/11/2.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPEventData;

@interface DynamicSquareCell : UITableViewCell

@property (nonatomic, strong) GPEventData   * eventData;
@property (nonatomic, strong) UIImageView   * userIcon;
@property (nonatomic, strong) UIImageView   * cellImgView;

@end
