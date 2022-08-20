//
//  HourlyDataService.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "HourlyDataService.h"
#import "WZConstant.h"
#import "NetworkManager.h"
#import "NSString+WZ.h"
#import "CityModel.h"

@implementation HourlyDataService

- (instancetype)init{
    if(self = [super init]){
        _hourlyArray = [NSMutableArray new];
    }
    return self;
}

- (void)fetchData:(CityModel*)city callback:(MyBlock)callBack{
    NSDictionary * params = @{

        @"location" : [NSString getCityCode: city.cityCode],
        @"key" : WEATHER_KEY
    };


    [[NetworkManager shared] simpleGet:HOURLY_API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray* hourlyArray = [NSMutableArray new];
        for(NSDictionary* data in responseObject[@"hourly"]){
            HourlyModel* item = [[HourlyModel alloc] initWithDict:data];
            [hourlyArray addObject:item];
        }

        callBack(hourlyArray);

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"======%@",error);
        }];
    
}

@end
