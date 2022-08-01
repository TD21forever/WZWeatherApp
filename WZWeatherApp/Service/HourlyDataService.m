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

- (void)fetchData:(CityModel*)city callback:(void (^)(void))callBack{
    NSDictionary * params = @{

        @"location" : [NSString getCityCode: city.cityCode],
        @"key" : WEATHER_KEY
    };


    [[NetworkManager shared] simpleGet:HOURLY_API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        __typeof__(self) __weak wself = self;
        NSLog(@"%@",responseObject[@"hourly"]);
        for(NSDictionary* data in responseObject[@"hourly"]){
            HourlyModel* item = [[HourlyModel alloc] initWithDict:data];
            [wself.hourlyArray addObject:item];
        }

        callBack();

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"======%@",error);
        }];
    
//        NSFileManager * manager = [NSFileManager defaultManager];
//        NSDate * content = [manager contentsAtPath:@"/Users/wenzhuo/Demos/iOS/Swift/Tutorial/WZWeatherApp/WZWeatherApp/Service/hourly.json"];
//        NSDictionary* data =  [NSJSONSerialization JSONObjectWithData:content options:kNilOptions error:nil];
//        for(NSDictionary *t in data[@"hourly"]){
//            HourlyModel* item = [[HourlyModel alloc] initWithDict:t];
//            [self.hourlyArray addObject:item];
//        }
    callBack();
    
}

@end
