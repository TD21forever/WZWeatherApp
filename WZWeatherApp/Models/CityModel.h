//
//  CityModel.h
//  WZWeatherApp
//
//  Created by T D on 2022/8/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityModel : NSObject



@property (nonatomic,copy) NSString *belongToCityChineseName;
@property (nonatomic,copy) NSString *cityChineseName;
@property (nonatomic,copy) NSString *provinceChineseName;
@property (nonatomic,copy) NSString *countryChineseName;
@property (nonatomic,copy) NSString * cityEnglishName;
@property (nonatomic,copy) NSString * cityCode;

@property (nonatomic,strong) NSArray * cityArray;

@end

NS_ASSUME_NONNULL_END
