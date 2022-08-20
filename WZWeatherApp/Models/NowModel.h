//
//  NowModel.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/30.
//
/*
 
 
 "now": {
   "obsTime": "2020-06-30T21:40+08:00",
   "temp": "24",
   "feelsLike": "26",
   "icon": "101",
   "text": "多云",
   "wind360": "123",
   "windDir": "东南风",
   "windScale": "1",
   "windSpeed": "3",
   "humidity": "72",
   "precip": "0.0",
   "pressure": "1003",
   "vis": "16",
   "cloud": "10",
   "dew": "21"
 },
 
 
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NowModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString * temp;
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * text;
@property (nonatomic,copy) NSString * pressure; // 气压
@property (nonatomic,copy) NSString * windDir; // 风向
@property (nonatomic,copy) NSString * windSpeed; // 风速
@property (nonatomic,copy) NSString * windScale; // 风力

- (instancetype)initWithDict:(NSDictionary*) data;

@end

NS_ASSUME_NONNULL_END
