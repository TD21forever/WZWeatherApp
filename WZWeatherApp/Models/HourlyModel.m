//
//  HourlyModel.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "HourlyModel.h"
#import "YYModel.h"


@implementation HourlyModel


+ (NSDictionary*)modelCustomPropertyMapper{
    return @{
        @"date":@"fxDate"
    };
}
- (instancetype)initWithDict:(NSDictionary*) data{
    if(self = [super init]){
        self = [HourlyModel yy_modelWithDictionary:data];
    }
    return self;
}

@end
