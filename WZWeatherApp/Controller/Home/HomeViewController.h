//
//  ViewController.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import <UIKit/UIKit.h>
@protocol MainVCDelegate <NSObject>

@required
- (void)updateCurCity;
@end

@interface HomeViewController : UIViewController


@end

