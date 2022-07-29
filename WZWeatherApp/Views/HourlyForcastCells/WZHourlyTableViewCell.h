//
//  WZHourlyTableViewCell.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import <UIKit/UIKit.h>
#import "WZHourlyCollectionViewCell.h"
#import "HourlyModel.h"

NS_ASSUME_NONNULL_BEGIN

//@interface WZHourlyCollectionView : UICollectionView
//
//@end


@interface WZHourlyTableViewCell : UITableViewCell
@property (nonatomic,strong) UICollectionView* collectionView;
@property (nonatomic,strong) NSMutableArray<HourlyModel*> * hourlyArray;


@end

NS_ASSUME_NONNULL_END
