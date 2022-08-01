//
//  NSString+WZ.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/2.
//

#import "NSString+WZ.h"

@implementation NSString (WZ)


+ (NSString*)getCityCode:(NSString*)cityCode{
    return [cityCode substringFromIndex:2];
}


@end
