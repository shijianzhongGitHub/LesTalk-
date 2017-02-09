//
//  DATabBar.h
//  独昂
//
//  Created by jianzhong on 15/5/28.
//  Copyright (c) 2015年 jianzhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DATabBar;

@protocol DATabBarDelegate <UITabBarDelegate>
@optional
-(void)tabBarDidClickCameraButton:(DATabBar *)tabBar;

@end

@interface DATabBar : UITabBar
@property(nonatomic, weak) id<DATabBarDelegate> delegate;

@end









