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
    _location.text = @"萧山区";
    _location.textColor = UIColor.whiteColor;
    _location.font = [UIFont systemFontOfSize:40];
    
    [_container addSubview:_location];
    
    // temperature
    _temperature = [UILabel new];
    _temperature.text = @"29°";
    _temperature.textColor = [UIColor whiteColor];
    _temperature.font = [UIFont systemFontOfSize:50];
    
    [_container addSubview:_temperature];
    
    _weather = [UILabel new];
    _weather.text = @"大部分晴朗";
    _weather.textColor = [UIColor whiteColor];
    _weather.font = [UIFont systemFontOfSize:30];

    
    [_container addSubview:_weather];
    
    _highLow = [UILabel new];
    _highLow.text = @"最高35 最低26";
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


@end
