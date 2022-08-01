//
//  CityModel.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/1.
//

#import "CityModel.h"
#import "YYModel.h"

@interface CityModel()

@end

@implementation CityModel

-(instancetype)init{
    if(self = [super init]){
        
    }
    return self;
}


- (NSArray *)cityArray{

    if(!_cityArray){
        _cityArray = [NSArray new];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cityCode" ofType:@"plist"];
        NSArray *data = [NSArray arrayWithContentsOfFile:path];
        _cityArray = [NSArray yy_modelArrayWithClass:[CityModel class] json:data];
    }
    return _cityArray;
}

@end
