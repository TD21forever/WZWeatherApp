//
//  backgroundVideoView.h
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WZBackgroundVideoView : UIView
- (void)update:(NSString*)weather with:(NSString*)dayOrNight;

@end

NS_ASSUME_NONNULL_END
