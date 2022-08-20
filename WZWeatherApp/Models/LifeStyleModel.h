//
//  LifeStyleModel.h
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LifeStyleModel : NSObject


@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *category;
@property (nonatomic,copy) NSString *text;

- (instancetype)initWithDict:(NSDictionary*) data;

@end

NS_ASSUME_NONNULL_END
