//
//  DailyDataService.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "DailyDataService.h"
#import "NetworkManager.h"
#import "WZConstant.h"
#import "DailyModel.h"
#import "YYModel.h"
#import "CityModel.h"
#import "NSString+WZ.h"

@interface DailyDataService()


@end

@implementation DailyDataService

- (instancetype)init{
    if(self = [super init]){
        _dailyArray = [NSMutableArray new];
    }
    return self;
}

- (void)fetchData:(CityModel*)city callback:(void (^)(void))callBack{

    NSDictionary * params = @{
        @"location" : [NSString getCityCode:city.cityCode],
        @"key" : WEATHER_KEY
    };

    [[NetworkManager shared] simpleGet:DAILY_API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        __typeof__(self) __weak wself = self;
        for(NSDictionary* data in responseObject[@"daily"]){
            DailyModel* item = [[DailyModel alloc] initWithDict:data];
            [wself.dailyArray addObject:item];
        }
        
        callBack();
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
}



@end
