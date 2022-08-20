//
//  HourlyDataService.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import <Foundation/Foundation.h>
#import "HourlyModel.h"
#import "CityModel.h"

typedef void (^MyBlock)(NSMutableArray* _Nonnull hourlyArray);

NS_ASSUME_NONNULL_BEGIN

@interface HourlyDataService : NSObject

@property (strong,nonatomic) NSMutableArray<HourlyModel*>* hourlyArray;

- (void)fetchData:(CityModel*)city callback:(MyBlock)callBack;
@end

NS_ASSUME_NONNULL_END
