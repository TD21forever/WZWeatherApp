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

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.temp forKey:@"temp"];
    [coder encodeObject:self.icon forKey:@"icon"];
    [coder encodeObject:self.text forKey:@"text"];
    [coder encodeObject:self.pressure forKey:@"pressure"];
    [coder encodeObject:self.windDir forKey:@"windDir"];
    [coder encodeObject:self.windSpeed forKey:@"windSpeed"];
    [coder encodeObject:self.windScale forKey:@"windScale"];
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self.temp = [coder decodeObjectForKey:@"temp"];
    self.icon = [coder decodeObjectForKey:@"icon"];
    self.text = [coder decodeObjectForKey:@"text"];
    self.pressure = [coder decodeObjectForKey:@"pressure"];
    self.windDir = [coder decodeObjectForKey:@"windDir"];
    self.windSpeed = [coder decodeObjectForKey:@"windSpeed"];
    self.windScale = [coder decodeObjectForKey:@"windScale"];
    return self;
}


@end
