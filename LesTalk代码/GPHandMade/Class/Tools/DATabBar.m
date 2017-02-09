//
//  DATabBar.m
//  独昂
//
//  Created by jianzhong on 15/5/28.
//  Copyright (c) 2015年 jianzhong. All rights reserved.
//

#import "DATabBar.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"


@interface DATabBar()
@property(nonatomic,weak)UIButton * cameraBtn;
@property(nonatomic,copy)UILabel  * tabBarItemLabel;
@end

@implementation DATabBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加一个按钮到tabbar中
        UIButton *cameraBtn = [[UIButton alloc] init];
        [cameraBtn setBackgroundImage:[UIImage imageNamed:@"dynamic"] forState:UIControlStateNormal];
        [cameraBtn setBackgroundImage:[UIImage imageNamed:@"dynamic_selected"] forState:UIControlStateHighlighted];
        cameraBtn.size = cameraBtn.currentBackgroundImage.size;
//        NSLog(@"xx   %f  yy %f",cameraBtn.size.height,cameraBtn.size.width);
        [cameraBtn addTarget:self action:@selector(cameraBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cameraBtn];
        self.cameraBtn = cameraBtn;
        
        UILabel *tabBarItemLabel = [[UILabel alloc] init];
        tabBarItemLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/3+3, 23, [UIScreen mainScreen].bounds.size.width/3, 30);
        tabBarItemLabel.text = @"LesTalk";
        tabBarItemLabel.textColor = [UIColor grayColor];
        tabBarItemLabel.font = [UIFont systemFontOfSize:10];
        tabBarItemLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:tabBarItemLabel];
//        self.tabBarItemLabel = tabBarItemLabel;
        
    }
    return self;
}

- (void)cameraBtnClick
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickCameraButton:)]) {
        [self.delegate tabBarDidClickCameraButton:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
    self.cameraBtn.centerX = self.width * 0.5;
    self.cameraBtn.centerY = self.height * 0.5-20;
    
    self.tabBarItemLabel.centerX = self.width * 0.5;
    self.tabBarItemLabel.centerY = self.height * 0.5;
    
    // 2.设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = self.width / 3;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            child.width = tabbarButtonW;
            // 设置x
            child.x = tabbarButtonIndex * tabbarButtonW;
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 1) {
                tabbarButtonIndex++;
            }
        }
    }
}

@end
