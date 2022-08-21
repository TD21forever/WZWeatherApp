//
//  backgroundVideoView.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import "WZBackgroundVideoView.h"
#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>
#import "WZConstant.h"
#import "UtilsManager.h"

@implementation WZBackgroundVideoView{
    AVPlayer * _player;
    AVPlayerLayer * _playerLayer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        NSURL *url = [[NSBundle mainBundle]URLForResource:@"default" withExtension:@"mp4"];
        
        _player = [[AVPlayer alloc]initWithURL: url];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        _playerLayer.frame = self.bounds;
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        [self.layer addSublayer:_playerLayer];
        [_player play];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playToEndNotification:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

- (void)playToEndNotification:(NSNotification*)sender{

    [_player seekToTime:kCMTimeZero];
    [_player play];
}

- (void)update:(NSString*)weather with:(NSString*)dayOrNight {
    AVPlayer* newPlayer = [[UtilsManager shared]getAVPlayerWithWeather:weather dayOrNight:dayOrNight];
    if (![newPlayer isEqual:_player]) {
        _player = newPlayer;
        [_player seekToTime:kCMTimeZero];
    }
    _playerLayer.player = _player;
    _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    [_player play];


    
   
}

@end
