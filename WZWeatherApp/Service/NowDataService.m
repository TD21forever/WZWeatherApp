//
//  NowDataService.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/30.
//

#import "NowDataService.h"
#import "WZConstant.h"
#import "NetworkManager.h"
#import "NSString+WZ.h"
#import "NowModel.h"


@implementation NowDataService

- (instancetype)init{
    if(self = [super init]){

    }
    return self;
}

- (void)fetchData:(CityModel*)city callback:(void (^)(NowModel*))callBack{

    NSDictionary * params = @{
        @"location" : [NSString getCityCode:city.cityCode],
        @"key" : WEATHER_KEY
    };
    
    [[NetworkManager shared] simpleGet:NOW_API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary* data = responseObject[@"now"];
        NowModel *nowModel = [[NowModel alloc]initWithDict:data];
        callBack(nowModel);

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"======%@",error);
        }];
}

@end
