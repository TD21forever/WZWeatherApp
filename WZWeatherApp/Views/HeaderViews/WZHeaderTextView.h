//
//  WZHeaderTextView.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import <UIKit/UIKit.h>
#import "NowModel.h"
#import "CityModel.h"
#import "DailyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WZHeaderTextView : UIView

@property (nonatomic,strong) NowModel* nowModel;
@property (nonatomic,strong) CityModel* curCity;
@property (nonatomic,strong) DailyModel* dailyModel;

@end

NS_ASSUME_NONNULL_END
