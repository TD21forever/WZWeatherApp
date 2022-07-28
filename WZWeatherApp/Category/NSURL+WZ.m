//
//  NSURL+WZ.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//

#import "NSURL+WZ.h"

@implementation NSURL (WZ)


+ (NSURL *)findImageUrl:(NSString *)string
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"weatherCode" ofType:@"plist"];
    NSArray *waetherArray = [NSArray arrayWithContentsOfFile:plistPath];
    for (NSDictionary *dic in waetherArray) {
        if ([dic[@"weatherCode"] isEqualToString:string]) {
            return [NSURL URLWithString:dic[@"weatherIconUrl"]];
        }
    }
    return nil;
}

@end
