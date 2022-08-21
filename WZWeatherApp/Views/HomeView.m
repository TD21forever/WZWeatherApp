//
//  HomeVIew.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "HomeView.h"
#import "WZHeaderTextView.h"
#import "Masonry.h"
#import "WZConstant.h"
#import "SDWebImage.h"

@interface HomeView()
@end

@implementation HomeView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pagingEnabled = NO;
        self.showsVerticalScrollIndicator = NO;
        self.allowsSelection = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.tableHeaderView = self.headerView;
                
        _backgroundVideoView = [[WZBackgroundVideoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        self.backgroundView = _backgroundVideoView;
    }
    return self;
}


- (WZHeaderTextView*)headerView{
    if(!_headerView){
        _headerView = [[WZHeaderTextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3)];
    }
    return _headerView;
}

- (void)setIsCleanMode:(Boolean)isCleanMode{
    _isCleanMode = isCleanMode;
    if(isCleanMode){
        self.backgroundColor = [UIColor blackColor];
        self.backgroundView = nil;
    } else {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = _backgroundVideoView;
    }
}

@end
