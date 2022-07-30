//
//  NowDataService.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/30.
//

#import "NowDataService.h"
#import "WZConstant.h"
#import "NetworkManager.h"

@implementation NowDataService

- (instancetype)init{
    if(self = [super init]){

    }
    return self;
}

- (void)fetchData:(void (^)(void))callBack{
    NSDictionary * params = @{

        @"location" : @"101010100",
        @"key" : WEATHER_KEY
    };


    
    [[NetworkManager shared] simpleGet:NOW_API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        __typeof__(self) __weak wself = self;

        NSDictionary* data = responseObject[@"now"];
        wself.nowModel = [[NowModel alloc] initWithDict:data];
        callBack();

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"======%@",error);
        }];
}

@end
