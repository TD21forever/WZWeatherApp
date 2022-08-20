//
//  LifeStyleDataService.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import "LifeStyleDataService.h"
#import "LifeStyleModel.h"
#import "NSString+WZ.h"
#import "WZConstant.h"
#import "CityModel.h"
#import "NetworkManager.h"

@implementation LifeStyleDataService


- (instancetype)init{
    if(self = [super init]){

    }
    return self;
}

- (void)fetchData:(CityModel*)city callback:(void (^)(NSMutableArray*lifeStyleArray))callBack{

    NSDictionary * params = @{
        @"location" : [NSString getCityCode:city.cityCode],
        @"key" : WEATHER_KEY,
        @"type": LIFT_TYPE
    };
    
    [[NetworkManager shared] simpleGet:LIFE_API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSMutableArray* lifeStyleArray = [NSMutableArray new];
        
        for(NSDictionary* data in responseObject[@"daily"]){
            LifeStyleModel* item = [[LifeStyleModel alloc] initWithDict:data];
            [lifeStyleArray addObject:item];
        }
        callBack(lifeStyleArray);

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"======%@",error);
        }];
}

@end
