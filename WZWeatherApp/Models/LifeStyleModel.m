//
//  LifeStyleModel.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import "LifeStyleModel.h"
#import "YYModel.h"

@implementation LifeStyleModel

- (instancetype)initWithDict:(NSDictionary*) data{
    if(self = [super init]){
        self = [LifeStyleModel yy_modelWithDictionary:data];
    }
    return self;
}

@end
