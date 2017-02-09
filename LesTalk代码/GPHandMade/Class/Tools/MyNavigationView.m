//
//  MyNavigationView.m
//  LesTalk
//
//  Created by 史建忠 on 2016/10/25.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "MyNavigationView.h"

@implementation MyNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)createMyNavigationBarWithBackGroundImage:(UIImage *)backgroundImage andTitle:(NSString *)title andLeftBBIImage:(UIImage *)leftBBIImage andLeftBBITitle:(NSString *)leftBBITitle andRightBBIImage:(UIImage *)rightBBIImage andRightBBITitle:(NSString *)rightBBITitle  andSEL:(SEL)sel andClass:(id)classObject
{
    self.backgroundColor=[UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
    imageView.frame = self.bounds;
    [self addSubview:imageView];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 20, 44, 44);
    leftBtn.tag=101;
    leftBtn.imageView.contentMode=UIViewContentModeCenter;
    leftBtn.titleLabel.font=[UIFont fontWithName:@"RTWSYueGoG0v1-Light" size:12];
    
    [leftBtn setImage:leftBBIImage forState:UIControlStateNormal];
    [leftBtn setTitle:leftBBITitle forState:UIControlStateNormal];
    //    [leftBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    //    leftBtn.imageEdgeInsets=UIEdgeInsetsMake(0, 10, 13, 23);
    [leftBtn addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-120, 27, 240, 30)];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.text = title;
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont fontWithName:@"RTWSYueGoG0v1-Light" size:12];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    self.rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-50, 25, 44, 30);
    self.rightBtn.tag=102;
    self.rightBtn.titleLabel.font=[UIFont fontWithName:@"RTWSYueGoG0v1-Light" size:12];
    self.rightBtn.imageView.contentMode=UIViewContentModeRight;
    [self.rightBtn setTitle:rightBBITitle forState:UIControlStateNormal];
    //    [self.rightBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [self.rightBtn setImage:rightBBIImage forState:UIControlStateNormal];
    self.rightBtn.imageEdgeInsets=UIEdgeInsetsMake(5, 10, 5,0 );
    [self.rightBtn addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightBtn];
    
    self.megImg = [[UIImageView alloc] initWithFrame:CGRectMake(33, 7, 8, 8)];
    self.megImg.backgroundColor = [UIColor redColor];
    self.megImg.layer.masksToBounds = YES;
    self.megImg.layer.cornerRadius = 4;
    [self.rightBtn addSubview:self.megImg];
    self.megImg.hidden = YES;
}


@end
