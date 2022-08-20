//
//  LifeStyleDataService.h
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import <Foundation/Foundation.h>
#import "CityModel.h"
#import "LifeStyleModel.h"
#import "LifeStyleDataService.h"

NS_ASSUME_NONNULL_BEGIN

@interface LifeStyleDataService : NSObject

- (void)fetchData:(CityModel*)city callback:(void (^)(NSMutableArray*lifeStyleArray))callBack;

@end

NS_ASSUME_NONNULL_END
