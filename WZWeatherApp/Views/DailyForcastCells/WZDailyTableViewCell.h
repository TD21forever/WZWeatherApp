//
//  WZDailyTableViewCell.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//

#import <UIKit/UIKit.h>
#import "../../Models/DailyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WZDailyTableViewCell : UITableViewCell
@property (nonatomic,strong)  DailyModel* dailyModel;
@end

NS_ASSUME_NONNULL_END
