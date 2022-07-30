//
//  DailyModel.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//

#import "DailyModel.h"
#import "YYModel.h"

@implementation DailyModel

-(instancetype)initForTest{
    if(self = [super init]){
        self.tempMin = @"1";
        self.tempMax = @"1";
        self.iconDay = @"1";
        self.textDay = @"1";
        self.iconNight = @"1";
        self.textNight = @"1";
        self.date = @"1";
    }
    return self;
}

+ (NSDictionary*)modelCustomPropertyMapper {
    return @{
        @"date":@"fxDate"
    };
}

- (instancetype)initWithDict:(NSDictionary*) data{
    if(self = [super init]){
        self = [DailyModel yy_modelWithDictionary:data];
    }
    return self;
}


@end
