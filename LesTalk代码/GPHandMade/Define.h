
//
//  Define.h
//  GPHandMade
//
//  Created by dandan on 16/5/20.
//  Copyright © 2016年 dandan. All rights reserved.
//

#ifndef Define_h
#define Define_h

/**
 *  屏幕尺寸
 */
#define CGSCREEN CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5AND5S (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6AND6S (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6PAND6SP (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
/**
 *  首页
 */
#define NumberSection 3
#define ZeroSection 3
#define OneSection 1
#define screenHeightRadio (SCREEN_HEIGHT/(([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)?568.0:(568.0-20)))
/**
 *  间隔
 */
#define GPNavBarBottom 64
#define GPTitlesViewH 40
#define GPTabBarH 49
#define GPEventScale 1.5
/**
 *  通知
 */

#define ClickPhoto @"ClickPhoto" // 点击图片
#define SnowUP @"snowUp" // 上滑
#define SnowDown @"snowDown" // 下滑
#define EventBarClick @"eventBarClick"
#define DaRenStep @"setpPics"
/**
 *  Get
 */

#define HomeBaseURl @"http://m.shougongke.com/index.php"
#define Blog @"http://www.jianshu.com/users/3e324b24a2a8/latest_articles"
#define Github @"https://github.com/GPPG"
/**
 *  颜色
 */

#define MintGreenColor [UIColor colorWithRed:196/255.0 green:247/255.0 blue:232/255.0 alpha:1.0] //薄荷绿
#define AppBackgroupColor [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0]
#define DHBColor(r,g,b,a)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define GPWriteToPlist(obj, filename) [obj writeToFile:[NSString stringWithFormat:@"/Users/mac/Desktop", filename] atomically:YES];
#define GPNameColor [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9]
#define GPColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define GPColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define GPRandomColor GPColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define GPGrayColor(v) GPColor(v, v, v)
#define GPCommonBgColor GPGrayColor(206)
#define GPBgColor [UIColor colorWithRed:0.92 green:0.34 blue:0.32 alpha:1]
#endif /* Define_h */
