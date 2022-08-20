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

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.tempMax forKey:@"tempMax"];
    [coder encodeObject:self.tempMin forKey:@"tempMin"];
    [coder encodeObject:self.iconDay forKey:@"iconDay"];
    [coder encodeObject:self.textDay forKey:@"textDay"];
    [coder encodeObject:self.iconNight forKey:@"iconNight"];
    [coder encodeObject:self.textNight forKey:@"textNight"];
    [coder encodeObject:self.date forKey:@"date"];
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self.tempMax = [coder decodeObjectForKey:@"tempMax"];
    self.tempMin = [coder decodeObjectForKey:@"tempMin"];
    self.iconDay = [coder decodeObjectForKey:@"iconDay"];
    self.textDay = [coder decodeObjectForKey:@"textDay"];
    self.iconNight = [coder decodeObjectForKey:@"iconNight"];
    self.textNight = [coder decodeObjectForKey:@"textNight"];
    self.date = [coder decodeObjectForKey:@"date"];
    return self;
}

@end
