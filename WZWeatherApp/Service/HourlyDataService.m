//
//  HourlyDataService.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "HourlyDataService.h"
#import "WZConstant.h"
#import "NetworkManager.h"
@implementation HourlyDataService

- (instancetype)init{
    if(self = [super init]){
        _hourlyArray = [NSMutableArray new];
    }
    return self;
}

- (void)fetchData:(void (^)(void))callBack{
    NSDictionary * params = @{
        
        @"location" : @"101010100",
        @"key" : WEATHER_KEY
    };


    [[NetworkManager shared] simpleGet:HOURLY_API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        __typeof__(self) __weak wself = self;
        
        for(NSDictionary* data in responseObject[@"hourly"]){
            HourlyModel* item = [[HourlyModel alloc] initWithDict:data];
            [wself.hourlyArray addObject:item];
        }
        
        callBack();
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"======%@",error);
        }];
}

@end
