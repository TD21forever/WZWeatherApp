//
//  DailyDataService.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import <Foundation/Foundation.h>
#import "DailyModel.h"
#import "CityModel.h"
/*
 1  block类型: int(^)(int, int)
 2  block变量: block
 3  block值: ^(int x, int y){
 4   return x + y ;
 5 };
 
 */


NS_ASSUME_NONNULL_BEGIN


@interface DailyDataService : NSObject

@property (strong,nonatomic) NSMutableArray<DailyModel*>* dailyArray;

- (void)fetchData:(CityModel*)city callback:(void (^)(void))callBack;

@end

NS_ASSUME_NONNULL_END
