//
//  NSString+WZ.h
//  WZWeatherApp
//
//  Created by T D on 2022/8/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WZ)

+ (NSString*)getCityCode:(NSString*)cityCode;

+ (NSString *)dateExchangeToWeek:(NSString *)day;


@end

NS_ASSUME_NONNULL_END
