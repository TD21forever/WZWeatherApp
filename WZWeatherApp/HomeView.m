//
//  HomeVIew.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "HomeView.h"
#import "WZHeaderTextView.h"
#import "WZDailyTableViewMainCell.h"
#import "Masonry.h"
#import "WZConstant.h"


@interface HomeView()


@property (nonatomic,strong) WZHeaderTextView *header;

@end

@implementation HomeView


- (instancetype)init
{
    self = [super init];
    if (self) {
        WZHeaderTextView *header = [WZHeaderTextView new];
        header.backgroundColor = [UIColor grayColor];
        header.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 400);
        
        self.tableView = [[UITableView alloc]init];
        self.tableView.pagingEnabled = YES;
        self.tableView.tableHeaderView = header;
        [self addSubview:self.tableView];

        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
    }
    return self;
}

@end
