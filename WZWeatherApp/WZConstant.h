//
//  WZConstant.h
//  Weather
//
//  Created by T D on 2022/7/28.
//

#import <Foundation/Foundation.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define WEATHER_ID @"HE2207282219281914"
#define WEATHER_KEY @"8e9cd25600764366883ed1f4dfef7110"
#define DAILY_API @"https://devapi.qweather.com/v7/weather/3d"
#define HOURLY_API @"https://devapi.qweather.com/v7/weather/24h"
#define NOW_API @"https://devapi.qweather.com/v7/weather/now?"


NS_ASSUME_NONNULL_BEGIN

@interface WZConstant : NSObject

@end

NS_ASSUME_NONNULL_END
