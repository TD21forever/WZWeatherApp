//
//  WZHeaderTextView.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "WZHeaderTextView.h"
#import "Masonry.h"
#import "WZConstant.h"

@implementation WZHeaderTextView {
    UILabel * _location;
    UILabel * _temperature;
    UILabel * _weather;
    UILabel * _highLow;
    UILabel * _wind;
    UIButton * _locationButton;

}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setupUI];
        [self addConstrains];
    }
    return self;
}

#pragma mark - 设置UI
- (void)setupUI{
    // location
//    _location = [UILabel new];
//    _location.text = @"";
//    _location.textColor = UIColor.whiteColor;
//    _location.font = TITLE_FONT;
//
//    [self addSubview:_location];
    
    // temperature
    _temperature = [UILabel new];
    _temperature.text = @"";
    _temperature.textColor = TEXT_COLOR;
    _temperature.font = LARGE_TITLE_FONT;
    [_temperature setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:_temperature];
    
    _weather = [UILabel new];
    _weather.text = @"";
    _weather.textColor = TEXT_COLOR;
    _weather.font = TABBAR_TEXT_FONT;

    
    [self addSubview:_weather];
    
    _highLow = [UILabel new];
    _highLow.text = @"";
    _highLow.textColor = TEXT_COLOR;
    _highLow.font = TABBAR_TEXT_FONT;

    [self addSubview:_highLow];
    
    _wind = [UILabel new];
    _wind.text = @"";
    _wind.textColor = TEXT_COLOR;
    _wind.font = TABBAR_TEXT_FONT;
    [self addSubview:_wind];
    
//    _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImageSymbolConfiguration* config = [UIImageSymbolConfiguration configurationWithFont:[UIFont systemFontOfSize:22]];
//    [_locationButton setImage:[UIImage systemImageNamed:@"location" withConfiguration:config] forState:UIControlStateNormal];
//    [self addSubview:_locationButton];
}

- (void)addConstrains{
    
    UIEdgeInsets paddings = UIEdgeInsetsMake(10, 10, 10, 10);
//    [_location mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.centerX.equalTo(self);
//        make.top.equalTo(self).offset(10);
//
//    }];
    [_temperature mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self).offset(5);
//        make.edges.equalTo(self).insets(paddings);
        make.top.equalTo(self).offset(paddings.top+20);
        
        
    }];
    [_weather mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(_temperature.mas_bottom).offset(paddings.top);
        
    }];
    [_highLow mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(self);
        make.top.equalTo(_weather.mas_bottom).offset(paddings.top);

    }];
    [_wind mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_highLow.mas_bottom).offset(20);
        make.centerX.equalTo(self);
            
    }];
    
//    [_locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self).offset(-20);
//            make.top.equalTo(self).offset(10);
//    }];
}



#pragma mark - Setter



- (void)setNowModel:(NowModel *)nowModel{
    
    _nowModel = nowModel;
    _temperature.text = [NSString stringWithFormat:@"%@°",nowModel.temp];
    _weather.text = [NSString stringWithFormat:@"%@",nowModel.text];
    _wind.text = [NSString stringWithFormat:@"%@%@级,风速%@公里/小时",nowModel.windDir,nowModel.windScale,nowModel.windSpeed];
    
}


- (void)setDailyModel:(DailyModel *)dailyModel{
    _dailyModel = dailyModel;
    _highLow.text = [NSString stringWithFormat:@"%@°/%@°",dailyModel.tempMin,dailyModel.tempMax];
}

- (void)setCurCity:(CityModel *)curCity{
    _curCity = curCity;
    _location.text = curCity.cityChineseName;
}

@end
