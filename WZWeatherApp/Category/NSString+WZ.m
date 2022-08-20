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


+ (NSString *)dateExchangeToWeek:(NSString *)day
{
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSDate * now = [dateformatter dateFromString:day];
    NSTimeInterval timeInterval = [now timeIntervalSince1970];
    
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday  fromDate:newDate];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

@end
