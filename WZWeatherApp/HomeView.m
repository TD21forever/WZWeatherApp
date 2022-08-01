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


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIImageView * backgroundImage = [UIImageView new];
        NSURL * url = [NSURL URLWithString:@"https://picsum.photos/id/1036/600/1000"];
        [backgroundImage sd_setImageWithURL:url];
        [backgroundImage sizeThatFits:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _headerView = [WZHeaderTextView new];
        _headerView.backgroundColor = [UIColor clearColor];
        _headerView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, SCREEN_HEIGHT / 2);
        
        self.tableView = [[UITableView alloc]init];
        self.tableView.pagingEnabled = NO;
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.showsVerticalScrollIndicator = NO;

        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.tableHeaderView = _headerView;
        self.tableView.backgroundView = backgroundImage;
        
        [self addSubview:self.tableView];
        
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        
        
    }
    return self;
}

@end
