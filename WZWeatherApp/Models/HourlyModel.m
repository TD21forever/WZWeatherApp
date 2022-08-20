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
        @"date":@"fxTime"
    };
}
- (instancetype)initWithDict:(NSDictionary*) data{
    if(self = [super init]){
        self = [HourlyModel yy_modelWithDictionary:data];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.temp forKey:@"temp"];
    [coder encodeObject:self.icon forKey:@"icon"];
    [coder encodeObject:self.text forKey:@"text"];

}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self.date = [coder decodeObjectForKey:@"date"];
    self.temp = [coder decodeObjectForKey:@"temp"];
    self.icon = [coder decodeObjectForKey:@"icon"];
    self.text = [coder decodeObjectForKey:@"text"];
    return self;
}

@end
