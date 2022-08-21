//
//  WZDailyTableViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//

#import "WZDailyTableViewCell.h"
#import "Masonry.h"
#import "SDWebImage.h"
#import "UtilsManager.h"
#import "NSString+WZ.h"
#import "WZConstant.h"

#define TABLE_TEXT_FONT [UIFont boldSystemFontOfSize:18]
#define IMAGE_SIZE CGSizeMake(34, 34)

@implementation WZDailyTableViewCell{
    UILabel * _dayLabel;
    UIImageView * _image;
    UILabel * _lowTmp;
    UILabel * _highTmp;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];

    
    // 日期
    _dayLabel = [UILabel new];
    _dayLabel.text = self.dailyModel.textDay;
    _dayLabel.font = TABLE_TEXT_FONT;
    _dayLabel.textColor = TEXT_COLOR;

    [self.contentView addSubview:_dayLabel];
    
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(padding);
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(25);
    }];
    
    // 图片
    _image = [[UIImageView alloc]initWithImage:[UIImage systemImageNamed:@"sun.max"]];
    [_image sizeToFit];
    [self.contentView addSubview:_image];
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(IMAGE_SIZE);
    }];
    
//    // 最低气温
    _lowTmp = [UILabel new];
    _lowTmp.text = self.dailyModel.tempMin;
    _lowTmp.font = TABLE_TEXT_FONT;
    _lowTmp.textColor = TEXT_COLOR;

    [self.contentView addSubview:_lowTmp];

  
//    // 最高气温
    _highTmp = [UILabel new];
    _highTmp.text = self.dailyModel.tempMax;
    _highTmp.font = TABLE_TEXT_FONT;
    _highTmp.textColor = TEXT_COLOR;

    [self.contentView addSubview:_highTmp];

    [_highTmp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    
    [_lowTmp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(_highTmp.mas_left).offset(-30);
    }];
    
    
}

- (void)setDailyModel:(DailyModel *)dailyModel{
    _dailyModel = dailyModel;
    
    _dayLabel.text = [NSString dateExchangeToWeek:dailyModel.date];
    
     
    _lowTmp.text = [NSString stringWithFormat:@"%@°",dailyModel.tempMin];
    _highTmp.text = [NSString stringWithFormat:@"%@°",dailyModel.tempMax];
    
    NSURL * url = [UtilsManager.shared imageUrlFromWeatherCode:_dailyModel.iconDay];
    [UtilsManager.shared genImageView:_image withUrl:url];
    
}


@end
