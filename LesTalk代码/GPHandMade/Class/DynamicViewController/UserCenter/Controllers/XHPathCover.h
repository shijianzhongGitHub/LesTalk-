//
//  XHPathConver.h
//  独昂
//
//  Created by jianzhong on 15/5/28.
//  Copyright (c) 2015年 jianzhong. All rights reserved.
//

#import <UIKit/UIKit.h>

// user info key for Dictionary
extern NSString *const XHUserNameKey;
extern NSString *const XHBirthdayKey;

@interface XHPathCover : UIView

// parallax background
@property (nonatomic, strong) UIImageView *bannerImageView;
@property (nonatomic, strong) UIImageView *bannerImageViewWithImageEffects;

// user info
@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *birthdayLabel;

@property (nonatomic, strong) UIButton * photoaBtn;
@property (nonatomic, strong) UIButton * followersBtn;//关注者
@property (nonatomic, strong) UIButton * followering;//正在关注
@property (nonatomic, strong) UIImageView * userMembersIcon;//会员图标

//scrollView call back
@property (nonatomic) BOOL touching;
@property (nonatomic) CGFloat offsetY;

// parallax background origin Y for parallaxHeight
@property (nonatomic, assign) CGFloat parallaxHeight; // default is 170， this height was not self heigth.

@property (nonatomic, assign) BOOL isZoomingEffect; // default is NO， if isZoomingEffect is YES, will be dissmiss parallax effect
@property (nonatomic, assign) BOOL isLightEffect; // default is YES
@property (nonatomic, assign) CGFloat lightEffectPadding; // default is 80
@property (nonatomic, assign) CGFloat lightEffectAlpha; // default is 1.12 (between 1 - 2)

@property (nonatomic, copy) void(^handleRefreshEvent)(void);

// stop Refresh
- (void)stopRefresh;

// background image
- (void)setBackgroundImage:(UIImage *)backgroundImage;
// custom set url for subClass， There is not work
- (void)setBackgroundImageUrlString:(id)backgroundImageUrlString;

// avatar image
- (void)setAvatarImage:(UIImage *)avatarImage;
// custom set url for subClass， There is not work
- (void)setAvatarUrlString:(NSString *)avatarUrlString;

// set info, Example : NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:@"Jack", @"userName", @"1990-10-19", @"birthday", nil];
- (void)setInfo:(NSDictionary *)info;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
@end
