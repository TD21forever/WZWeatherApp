//
//  UtilsManager.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UtilsManager : NSObject

+ (instancetype)shared;

- (NSURL*)imageUrlFromWeatherCode:(NSString *)string;

- (void)genImageView:(UIImageView*)imageView withUrl:(NSURL*)url;


@end

NS_ASSUME_NONNULL_END
