//
//  NSURL+WZ.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (WZ)

// plist文件中查找天气图片url
+ (NSURL *)findImageUrl:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
