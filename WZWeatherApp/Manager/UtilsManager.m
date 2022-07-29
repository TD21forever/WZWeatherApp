//
//  UtilsManager.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "UtilsManager.h"
#import "SDWebImage.h"

@implementation UtilsManager

+ (instancetype)shared{
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shared = [[self alloc]init];
    });
    return _shared;
}

- (NSURL*)imageUrlFromWeatherCode:(NSString *)string{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"weatherCode" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:plistPath];
    for (NSDictionary * dic in array){
        if([dic[@"weatherCode"] isEqualToString:string]){
            return [NSURL URLWithString:dic[@"weatherIconUrl"]];
        }
    }
    return [NSURL URLWithString:@"https://picsum.photos/20"];
}

- (void)genImageView:(UIImageView*)imageView withUrl:(NSURL*)url{
    [imageView sd_setImageWithURL:url];
}

@end
