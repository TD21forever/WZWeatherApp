//
//  UtilsManager.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "UtilsManager.h"
#import "SDWebImage.h"
#import "UIImage+WZ.h"
#import "WZConstant.h"
#import <AVKit/AVKit.h>

static NSMutableDictionary * _cache;

@implementation UtilsManager

+ (instancetype)shared{
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shared = [[self alloc]init];
        _cache = [[NSMutableDictionary alloc]init];
        [self initAllPlayers];

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
    NSString* newCode = [[NSString alloc]initWithFormat:@"%d",[string intValue] - 50];
    for (NSDictionary * dic in array){
        if([dic[@"weatherCode"] isEqualToString:newCode]){
            return [NSURL URLWithString:dic[@"weatherIconUrl"]];
        }
    }
    
    return [NSURL URLWithString:@"https://picsum.photos/20"];
}

- (void)genImageView:(UIImageView*)imageView withUrl:(NSURL*)url{

    [imageView sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [imageView setImage:[image imageWithColor:[UIColor whiteColor]]];
    }];
}

+ (void)initAllPlayers{
    NSArray<NSString*>*  fileNameArray = @[
        
        @"default_day",
        @"cloudly_night",
        @"rain_day",
        @"rain_night",
        @"windy_day",
        @"windy_night",
        @"default_night",
        @"partly_cloud_day",
        @"partly_cloud_night",
        @"cloudy_day"
    
    ];
    for(NSString* filename in fileNameArray){
        AVPlayer * player;
        NSURL *url = [[NSBundle mainBundle]URLForResource:filename withExtension:@"mp4"];
        player = [[AVPlayer alloc]initWithURL:url];
        [_cache setValue:player forKey:filename];
    }
}

- (AVPlayer*)getAVPlayerWithWeather:(NSString*)weather dayOrNight:(NSString*)dayOrNight{
    
    NSString * s1 = @"default";
    if([weather containsString:@"风"]){
        s1 = @"windy";
    } else if([weather containsString:@"雨"]){
        s1 = @"rain";
    }else if([weather containsString:@"云"]){
        s1 = @"cloudy";
    } else if([weather containsString:@"晴"]){
        s1 = @"default";
    } else if ([weather containsString:@"阴"]){
        s1 = @"partly_cloud";
    }
    AVPlayer * player;
    NSString *filename = [NSString stringWithFormat:@"%@_%@",s1,dayOrNight];
    NSURL *url = [[NSBundle mainBundle]URLForResource:filename withExtension:@"mp4"];
    player = [_cache objectForKey:filename];

    return player;
    
    
}



@end
