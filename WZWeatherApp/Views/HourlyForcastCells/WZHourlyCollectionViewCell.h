//
//  WZHourlyCollectionCellViewCollectionViewCell.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import <UIKit/UIKit.h>
#import "HourlyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WZHourlyCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) HourlyModel * hourlyModel;
@end

NS_ASSUME_NONNULL_END
