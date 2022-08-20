//
//  LocationManager.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


NS_ASSUME_NONNULL_BEGIN

@interface LocationManager : NSObject

+ (instancetype)shared;

- (void)setupCurLocation;

@end

NS_ASSUME_NONNULL_END
