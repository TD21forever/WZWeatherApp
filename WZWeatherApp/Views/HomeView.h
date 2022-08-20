//
//  HomeVIew.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import <UIKit/UIKit.h>
#import "WZHeaderTextView.h"
#import "WZBackgroundVideoView.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UITableView
@property (nonatomic,strong) WZHeaderTextView* headerView;
@property (nonatomic,strong) WZBackgroundVideoView * backgroundVideoView;
@property (nonatomic,assign) Boolean isCleanMode;

@end

NS_ASSUME_NONNULL_END
