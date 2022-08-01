//
//  WZHeaderTextView.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "WZHeaderTextView.h"
#import "Masonry.h"


@implementation WZHeaderTextView {
    UILabel * _location;
    UILabel * _temperature;
    UILabel * _weather;
    UILabel * _highLow;
    UIView * _container;
}

- (void)setupUI{
    // location
    _location = [UILabel new];
    _location.text = @"";
    _location.textColor = UIColor.whiteColor;
    _location.font = [UIFont systemFontOfSize:40];
    
    [_container addSubview:_location];
    
    // temperature
    _temperature = [UILabel new];
    _temperature.text = @"";
    _temperature.textColor = [UIColor whiteColor];
    _temperature.font = [UIFont systemFontOfSize:80];
    
    [_container addSubview:_temperature];
    
    _weather = [UILabel new];
    _weather.text = @"";
    _weather.textColor = [UIColor whiteColor];
    _weather.font = [UIFont systemFontOfSize:30];

    
    [_container addSubview:_weather];
    
    _highLow = [UILabel new];
    _highLow.text = @"";
    _highLow.textColor = [UIColor whiteColor];
    _highLow.font = [UIFont systemFontOfSize:30];

    [_container addSubview:_highLow];
}

- (void)addConstrains{
    
    UIEdgeInsets paddings = UIEdgeInsetsMake(30, 30, 30, 30);
    [_location mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_container.mas_centerX);
        make.top.equalTo(_container.mas_top).offset(paddings.top);
        
    }];
    [_temperature mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_location.mas_centerX);
        make.top.equalTo(_location.mas_bottom).offset(paddings.top);
        
    }];
    [_weather mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_container.mas_centerX);
        make.top.equalTo(_temperature.mas_bottom).offset(paddings.top);
        
    }];
    [_highLow mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(_container.mas_centerX);
        make.top.equalTo(_weather.mas_bottom).offset(paddings.top);

    }];
    
}

- (instancetype)init{
    if (self = [super init]){
        _container = self;
        [self setupUI];
        [self addConstrains];
    }
    return self;
}


- (void)setNowModel:(NowModel *)nowModel{
    
    _nowModel = nowModel;
    
    _temperature.text = [NSString stringWithFormat:@"%@°",nowModel.temp];
    _weather.text = [NSString stringWithFormat:@"%@°",nowModel.text];
    
}

- (void)setDailyModel:(DailyModel *)dailyModel{
    _dailyModel = dailyModel;
    _highLow.text = [NSString stringWithFormat:@"%@°/%@°",dailyModel.tempMin,dailyModel.tempMax];
}

- (void)setCurCity:(CityModel *)curCity{
    NSLog(@"Set cur city");
    _curCity = curCity;
    _location.text = curCity.cityChineseName;
}
@end
