//
//  DailyModel.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//
//
/*
 {
   "code": "200",
   "updateTime": "2021-11-15T16:35+08:00",
   "fxLink": "http://hfx.link/2ax1",
   "daily": [
     {
       "fxDate": "2021-11-15",
       "sunrise": "06:58",
       "sunset": "16:59",
       "moonrise": "15:16",
       "moonset": "03:40",
       "moonPhase": "盈凸月",
       "moonPhaseIcon": "803",
       "tempMax": "12",
       "tempMin": "-1",
       "iconDay": "101",
       "textDay": "多云",
       "iconNight": "150",
       "textNight": "晴",
       "wind360Day": "45",
       "windDirDay": "东北风",
       "windScaleDay": "1-2",
       "windSpeedDay": "3",
       "wind360Night": "0",
       "windDirNight": "北风",
       "windScaleNight": "1-2",
       "windSpeedNight": "3",
       "humidity": "65",
       "precip": "0.0",
       "pressure": "1020",
       "vis": "25",
       "cloud": "4",
       "uvIndex": "3"
     },
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

@interface DailyModel : NSObject

@property (nonatomic,copy) NSString * tempMax;
@property (nonatomic,copy) NSString * tempMin;
@property (nonatomic,copy) NSString * iconDay;
@property (nonatomic,copy) NSString * textDay;
@property (nonatomic,copy) NSString * iconNight;
@property (nonatomic,copy) NSString * textNight;
@property (nonatomic,copy) NSString * date;

- (instancetype)initWithDict:(NSDictionary*) data;

@end

NS_ASSUME_NONNULL_END
