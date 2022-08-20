//
//  NowDataService.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/30.
//

#import <Foundation/Foundation.h>
#import "NowModel.h"
#import "CityModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface NowDataService : NSObject

- (void)fetchData:(CityModel*)city callback:(void (^)(NowModel*))callBack;

@end

NS_ASSUME_NONNULL_END
