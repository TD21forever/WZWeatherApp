//
//  WZHourlyCollectionCellViewCollectionViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "WZHourlyCollectionViewCell.h"
#import "Masonry.h"
#import "UtilsManager.h"

#define TEXT_FONT 12
#define IMAGE_SIZE CGSizeMake(20, 20)
@interface WZHourlyCollectionViewCell()

@property (nonatomic,strong) UILabel* hour;
@property (nonatomic,strong) UIImageView* image;
@property (nonatomic,strong) UILabel* temprature;
@property (nonatomic,strong) UIView* container;

@end

@implementation WZHourlyCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _container = self;
        NSLog(@"初始化=======@@@@======");
        [self createUI];
    }
    return self;
}

- (void)createUI{

    _hour = [UILabel new];
    _hour.text = @"现在";
    _hour.textColor = [UIColor whiteColor];
    _hour.font = [UIFont systemFontOfSize:TEXT_FONT];
    
    [_container addSubview:_hour];
    
    [_hour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_container);
        make.top.offset(10);
    }];
    
    _image = [[UIImageView alloc]initWithImage:[UIImage systemImageNamed:@"cloud.moon"]];
    [_image sizeToFit];
    
    [_container addSubview:_image];
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(IMAGE_SIZE);
        make.top.equalTo(_hour.mas_top).offset(5);
    }];
    
}

- (void)setHourlyModel:(HourlyModel *)hourlyModel{
    _hourlyModel = hourlyModel;
    
//    _hour.text = [NSString stringWithFormat:@"%@",_hourlyModel.date];
    
    _hour.text = [NSString stringWithFormat:@"现在"];
    
    NSURL *url = [UtilsManager.shared imageUrlFromWeatherCode:_hourlyModel.icon];
    [UtilsManager.shared genImageView:_image withUrl:url];
}

@end


