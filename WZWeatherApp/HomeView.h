//
//  HomeVIew.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import <UIKit/UIKit.h>
#import "WZHeaderTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView
@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) WZHeaderTextView* headerView;
@end

NS_ASSUME_NONNULL_END
