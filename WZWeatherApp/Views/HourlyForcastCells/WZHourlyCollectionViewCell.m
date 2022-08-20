//
//  WZHourlyCollectionCellViewCollectionViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "WZHourlyCollectionViewCell.h"
#import "Masonry.h"
#import "UtilsManager.h"
#import "WZConstant.h"

#define TEXT_FONT [UIFont boldSystemFontOfSize:18]
#define IMAGE_SIZE CGSizeMake(24, 24)


@interface WZHourlyCollectionViewCell()

@property (nonatomic,strong) UILabel* hour;
@property (nonatomic,strong) UIImageView* image;
@property (nonatomic,strong) UILabel* temprature;

@end

@implementation WZHourlyCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{

    // 时间
    _hour = [UILabel new];
    _hour.text = @"";
    _hour.textColor = TEXT_COLOR;
    _hour.font = TEXT_FONT;
    
    [self.contentView addSubview:_hour];
    
    [_hour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(8);
    }];
    
    // 图片
    _image = [[UIImageView alloc]initWithImage:[UIImage systemImageNamed:@"cloud.moon"]];
    [_image sizeToFit];
    
    [self.contentView addSubview:_image];
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(IMAGE_SIZE);
        make.top.equalTo(_hour.mas_bottom).offset(8);
    }];
    
    // 温度
    _temprature = [UILabel new];
    _temprature.text = @"现在";
    _temprature.textColor = TEXT_COLOR;
    _temprature.font = TEXT_FONT;
    
    [self.contentView addSubview:_temprature];
    
    [_temprature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_image.mas_bottom).offset(8);

    }];
    
    
}

- (void)setHourlyModel:(HourlyModel *)hourlyModel{
    _hourlyModel = hourlyModel;
    _hour.text = [NSString stringWithFormat:@"%@时", [hourlyModel.date substringWithRange:NSMakeRange(hourlyModel.date.length-11, 2)]];
    
    NSURL *url = [UtilsManager.shared imageUrlFromWeatherCode:_hourlyModel.icon];
    [UtilsManager.shared genImageView:_image withUrl:url];
    
    _temprature.text = [NSString stringWithFormat:@"%@°",hourlyModel.temp];
}

@end


