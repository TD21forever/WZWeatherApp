//
//  LifeStyleTableViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import "LifeStyleTableViewCell.h"
#import "Masonry.h"
#import "WZConstant.h"

@implementation LifeStyleTableViewCell{
    UILabel * _name;
    UILabel * _category;
    UILabel * _text;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _name = [UILabel new];
    _category = [UILabel new];
    _text = [UILabel new];
    
    _name.font = TABBAR_TEXT_FONT;
    _name.text = @"运动指数";
    _category.font = TABBAR_TEXT_FONT;
    _category.text = @"运动指数";
    
    _text.font = TEXT_FONT;
    _text.text = @"运动指数";
    _text.numberOfLines = 3;
    
    _text.textColor = [UIColor grayColor];
    
    
    [self.contentView addSubview:_name];
    [self.contentView addSubview:_category];
    [self.contentView addSubview:_text];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(20);
        make.top.equalTo(self).offset(20);
    }];
    [_category mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-20);
            make.centerY.equalTo(_name);
    }];
    [_text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_name.mas_bottom).offset(15);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.equalTo(self).multipliedBy(0.6);
    }];
    
}


- (void)setLifeStyleModel:(LifeStyleModel *)lifeStyleModel{
    _lifeStyleModel = lifeStyleModel;
    _name.text = lifeStyleModel.name;
    _category.text = lifeStyleModel.category;
    _text.text = lifeStyleModel.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
