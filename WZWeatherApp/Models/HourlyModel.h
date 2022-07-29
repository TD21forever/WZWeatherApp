//
//  HourlyModel.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//
/*
 {
   "code": "200",
   "updateTime": "2021-02-16T13:35+08:00",
   "fxLink": "http://hfx.link/2ax1",
   "hourly": [
     {
       "fxTime": "2021-02-16T15:00+08:00",
       "temp": "2",
       "icon": "100",
       "text": "晴",
       "wind360": "335",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "20",
       "humidity": "11",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "0",
       "dew": "-25"
     }
   ],
   "refer": {
     "sources": [
       "QWeather",
       "NMC",
       "ECMWF"
     ],
     "license": [
       "commercial license"
     ]
   }
 }
 
 
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HourlyModel : NSObject

@property (nonatomic,copy) NSString * date;
@property (nonatomic,copy) NSString * temp;
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * text;


- (instancetype)initWithDict:(NSDictionary*) data;

@end

NS_ASSUME_NONNULL_END
