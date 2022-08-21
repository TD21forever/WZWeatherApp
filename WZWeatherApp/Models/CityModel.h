//
//  CityModel.h
//  WZWeatherApp
//
//  Created by T D on 2022/8/1.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityModel : NSObject<NSCoding>



@property (nonatomic,copy) NSString *belongToCityChineseName;
@property (nonatomic,copy) NSString *cityChineseName;
@property (nonatomic,copy) NSString *provinceChineseName;
@property (nonatomic,copy) NSString *countryChineseName;
@property (nonatomic,copy) NSString * cityEnglishName;
@property (nonatomic,copy) NSString * cityCode;



+ (NSArray*)getCityArray;

+ (CityModel*)getCurCityWithCityName:(NSString*)cityName;



@end

NS_ASSUME_NONNULL_END
