//
//  NowDataService.h
//  WZWeatherApp
//
//  Created by T D on 2022/7/30.
//

#import <Foundation/Foundation.h>
#import "NowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NowDataService : NSObject

@property (strong,nonatomic) NSMutableArray<NowModel*> * nowArray;

- (void)fetchData:(void (^)(void)) callBack;


@end

NS_ASSUME_NONNULL_END
