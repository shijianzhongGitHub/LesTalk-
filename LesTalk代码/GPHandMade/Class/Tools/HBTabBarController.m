//
//  HBTabBarController.m
//  LesTalk
//
//  Created by 史建忠 on 2016/10/25.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "HBTabBarController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "DynamicViewController.h"
#import "GPHomController.h"

@interface HBTabBarController ()

@end

@implementation HBTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MessageViewController * MessageVc = [[MessageViewController alloc] init];
    [self addChildVc:MessageVc title:@"消息" image:@"message" selectedImage:@"message_selected" tag:0];
    
    GPHomController * dynamicVc = [[GPHomController alloc] init];
//    dynamicVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-15, 0, 15, 0);
    [self addChildVc:dynamicVc title:@"LesTalk" image:@"动态灰" selectedImage:@"动态红" tag:1];
    
    MineViewController * mineVc = [[MineViewController alloc] init];
    [self addChildVc:mineVc title:@"个人中心" image:@"me" selectedImage:@"me_selected" tag:2];
}

- (void)addChildVc:(UIViewController *)childVc  title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage tag:(NSInteger)tabTag
{
    //设置自控制器的文字
    [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(2, -4)];
    childVc.title = title;//同时设置tabbar的navigationBar的文字
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    textAttrs[NSFontAttributeName] = [UIFont fontWithName:@"RTWSYueGoG0v1-Light" size:10];
    NSMutableDictionary * selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    selectedTextAttrs[NSFontAttributeName] = [UIFont fontWithName:@"RTWSYueGoG0v1-Light" size:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    //    childVc.view.backgroundColor = [UIColor blackColor];//添加报错
    childVc.tabBarItem.tag = tabTag;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
