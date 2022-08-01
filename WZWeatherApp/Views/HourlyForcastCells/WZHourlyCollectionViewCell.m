//
//  WZHourlyCollectionCellViewCollectionViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "WZHourlyCollectionViewCell.h"
#import "Masonry.h"
#import "UtilsManager.h"

#define TEXT_FONT 18
#define IMAGE_SIZE CGSizeMake(24, 24)
@interface WZHourlyCollectionViewCell()

@property (nonatomic,strong) UILabel* hour;
@property (nonatomic,strong) UIImageView* image;
@property (nonatomic,strong) UILabel* temprature;

@end

@implementation WZHourlyCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createUI];
    }
    return self;
}

- (void)createUI{

    _hour = [UILabel new];
    _hour.text = @"";
    _hour.textColor = [UIColor whiteColor];
    _hour.font = [UIFont systemFontOfSize:TEXT_FONT];
    
    [self.contentView addSubview:_hour];
    
    [_hour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(8);
    }];
    
    _image = [[UIImageView alloc]initWithImage:[UIImage systemImageNamed:@"cloud.moon"]];
    [_image sizeToFit];
    
    [self.contentView addSubview:_image];
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(IMAGE_SIZE);
        make.top.equalTo(_hour.mas_bottom).offset(8);
    }];
    
    
    _temprature = [UILabel new];
    _temprature.text = @"现在";
    _temprature.textColor = [UIColor whiteColor];
    _temprature.font = [UIFont systemFontOfSize:TEXT_FONT];
    
    [self.contentView addSubview:_temprature];
    
    [_temprature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_image.mas_bottom).offset(8);

    }];
    
    
}

- (void)setHourlyModel:(HourlyModel *)hourlyModel{
    _hourlyModel = hourlyModel;
    
//    _hour.text = [NSString stringWithFormat:@"%@",_hourlyModel.date];
    
    _hour.text = [NSString stringWithFormat:@"现在"];
    
    NSURL *url = [UtilsManager.shared imageUrlFromWeatherCode:_hourlyModel.icon];
    [UtilsManager.shared genImageView:_image withUrl:url];
    
    _temprature.text = [NSString stringWithFormat:@"%@°",hourlyModel.temp];
}

@end


