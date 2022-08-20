//
//  LifeStyleTableVC.h
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import <UIKit/UIKit.h>
#import "CityModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LifeStyleTableVC : UITableViewController
@property (nonatomic,strong) CityModel* curCity;
@end

NS_ASSUME_NONNULL_END
