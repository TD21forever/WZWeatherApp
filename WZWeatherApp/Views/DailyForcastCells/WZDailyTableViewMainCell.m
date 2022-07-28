//
//  WZDailyTableViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/28.
//


#import "WZDailyTableViewMainCell.h"
#import "WZDailyTableViewCell.h"
@interface WZDailyTableViewMainCell()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView* dailyForecastTableView;

@end

@implementation WZDailyTableViewMainCell

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

# warning Here
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WZDailyTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"test" forIndexPath:indexPath];
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
