//
//  WZConstant.h
//  Weather
//
//  Created by T D on 2022/7/28.
//

#import <Foundation/Foundation.h>



#pragma mark- API宏定义

#define WEATHER_ID @"HE2207282219281914"
#define WEATHER_KEY @"a83ae2e814284c3eb8079b65bd63db5e"
#define DAILY_API @"https://devapi.qweather.com/v7/weather/7d"
#define HOURLY_API @"https://devapi.qweather.com/v7/weather/24h"
#define NOW_API @"https://devapi.qweather.com/v7/weather/now"
#define LIFE_API @"https://devapi.qweather.com/v7/indices/1d"
#define LIFT_TYPE @"1,2,3,4,5,6"


#pragma mark- 屏幕宏定义
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#pragma mark- 字体宏定义
#define TITLE_FONT [UIFont boldSystemFontOfSize:34]
#define TABLE_VIEW_TEXT_FONT [UIFont boldSystemFontOfSize:34]
#define TABBAR_TEXT_FONT [UIFont boldSystemFontOfSize:20]
#define SUB_TEXT_FONT [UIFont boldSystemFontOfSize:25]
#define LARGE_TITLE_FONT [UIFont boldSystemFontOfSize:100]
#define TEXT_FONT [UIFont boldSystemFontOfSize:14]
#define TEXT_COLOR [UIColor whiteColor];

#pragma -mark APP宏定义
#define WeakSelf __weak typeof(self) weakSelf = self;

NS_ASSUME_NONNULL_BEGIN

@interface WZConstant : NSObject

@end

NS_ASSUME_NONNULL_END
