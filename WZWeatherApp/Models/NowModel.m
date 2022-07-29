//
//  NowModel.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/30.
//

#import "NowModel.h"
#import "YYModel.h"

@implementation NowModel

- (instancetype)initWithDict:(NSDictionary*) data{
    if(self = [super init]){
        self = [NowModel yy_modelWithDictionary:data];
    }
    return self;
}


@end
