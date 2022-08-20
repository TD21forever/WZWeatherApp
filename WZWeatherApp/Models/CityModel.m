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


+ (NSArray *)getCityArray{

    NSArray * cityArray;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cityCode" ofType:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:path];
    cityArray = [NSArray yy_modelArrayWithClass:[CityModel class] json:data];
    
    return cityArray;
}

+ (CityModel*)getCurCityWithCityName:(NSString*)cityName{
    NSArray * cityArray = [CityModel getCityArray];
    if([cityName isEqual:@""]){
        return cityArray[0];
    }
    for(CityModel* city in cityArray){
        if([cityName containsString:city.cityChineseName]){
            return city;
        }
    }
    return cityArray[0];
    
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.belongToCityChineseName forKey:@"belongToCityChineseName"];
    [coder encodeObject:self.cityChineseName forKey:@"cityChineseName"];
    [coder encodeObject:self.provinceChineseName forKey:@"provinceChineseName"];
    [coder encodeObject:self.countryChineseName forKey:@"countryChineseName"];
    [coder encodeObject:self.cityEnglishName forKey:@"cityEnglishName"];
    [coder encodeObject:self.cityCode forKey:@"cityCode"];
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self.belongToCityChineseName = [coder decodeObjectForKey:@"belongToCityChineseName"];
    self.cityChineseName = [coder decodeObjectForKey:@"cityChineseName"];
    self.provinceChineseName = [coder decodeObjectForKey:@"provinceChineseName"];
    self.countryChineseName = [coder decodeObjectForKey:@"countryChineseName"];
    self.cityEnglishName = [coder decodeObjectForKey:@"cityEnglishName"];
    self.cityCode = [coder decodeObjectForKey:@"cityCode"];

    return self;
}

@end
