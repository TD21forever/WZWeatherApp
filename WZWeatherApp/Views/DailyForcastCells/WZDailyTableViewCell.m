//
//  WZDailyTableViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//

#import "WZDailyTableViewCell.h"
#import "Masonry.h"
@implementation WZDailyTableViewCell{
    UILabel * _dayLabel;
    UIImageView * _image;
    UILabel * _lowTmp;
    UILabel * _highTmp;
    UIView * _container;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _container = self;
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    
    // 日期
    _dayLabel = [UILabel new];
    _dayLabel.text = self.dailyModel.textDay;
    _dayLabel.font = [UIFont systemFontOfSize:22];
    
    [_container addSubview:_dayLabel];
    
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(padding);
        make.centerY.equalTo(_container.mas_centerY);
        make.left.equalTo(_container.mas_left).offset(10);
    }];
    
    // 图片
    _image = [[UIImageView alloc]initWithImage:[UIImage systemImageNamed:@"sun.max"]];
    
    [_container addSubview:_image];
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_container.mas_centerY);
        make.left.equalTo(_dayLabel.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
//    // 最低气温
    _lowTmp = [UILabel new];
    _lowTmp.text = self.dailyModel.tempMin;
    _lowTmp.font = [UIFont systemFontOfSize:22];

    [_container addSubview:_lowTmp];

    [_lowTmp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_container.mas_centerY);
        make.left.equalTo(_image.mas_right).offset(20);
    }];
//
//    // 最高气温
    _highTmp = [UILabel new];
    _highTmp.text = self.dailyModel.tempMax;
    _highTmp.font = [UIFont systemFontOfSize:22];

    [_container addSubview:_highTmp];

    [_highTmp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_container.mas_centerY);
        make.left.equalTo(_lowTmp.mas_right).offset(20);
    }];
    
    
}

- (void)setDailyModel:(DailyModel *)dailyModel{
    _dailyModel = dailyModel;
    
    _dayLabel.text = [NSString stringWithFormat: @"星期 %@",dailyModel.date];
    
    _lowTmp.text = [NSString stringWithFormat:@"%@°",dailyModel.tempMin];
    _highTmp.text = [NSString stringWithFormat:@"%@°",dailyModel.tempMax];
    
    _image = [[UIImageView alloc]initWithImage:[UIImage systemImageNamed:@"sun.max"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
