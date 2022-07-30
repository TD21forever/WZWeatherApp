//
//  ViewController.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "ViewController.h"
#import "HomeView.h"
#import "Masonry.h"
#import "WZHeaderTextView.h"
#import "WZConstant.h"
#import "WZDailyTableViewCell.h"
#import "DailyModel.h"
#import "NetworkManager.h"
#import "DailyDataService.h"
#import "HourlyDataService.h"
#import "WZHourlyCollectionViewCell.h"
#import "WZHourlyTableViewCell.h"
#import "NowDataService.h"

#define Height [UIScreen mainScreen].bounds.size.height
#define Width [UIScreen mainScreen].bounds.size.width

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong) HomeView* home;
@property (nonatomic,strong) DailyDataService* daily;
@property (nonatomic,strong) HourlyDataService* hourly;
@property (nonatomic,strong) NowDataService* now;

@property (nonatomic,strong) NSArray* sectionNames;
@property (nonatomic,strong) NSMutableArray* tableViewData;

@property (nonatomic,strong) WZDailyTableViewCell * dailyCell;
@property (nonatomic,strong) WZHourlyTableViewCell * hourlyCell;

@end

@implementation ViewController


- (void)initService {
    _daily = [DailyDataService new];
    _hourly = [HourlyDataService new];
    _now = [NowDataService new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initService];
    
    [_daily fetchData:^{
        NSLog(@"%@",self->_daily.dailyArray);
        [self->_home.tableView reloadData];

    }];
    
    [_hourly fetchData:^{
        NSLog(@"%@ hourly",self->_hourly.hourlyArray);
        [self->_home.tableView reloadData];
    }];
    
    [_now fetchData:^{
        NSLog(@"%@ now now model",self->_now.nowModel);
        self->_home.headerView.nowModel = self->_now.nowModel;
        [self->_home.tableView reloadData];
    }];
    
    _sectionNames = @[@"Section1",@"Section2"];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.home = [HomeView new];
    self.home.frame = CGRectMake(0, 0, Width, Height);
    [self.view addSubview:self.home];
    
    self.home.tableView.delegate = self;
    self.home.tableView.dataSource = self;
    

    _dailyCell = [WZDailyTableViewCell new];
    _hourlyCell = [WZHourlyTableViewCell new];
    
    [self.home.tableView registerClass:[_dailyCell class] forCellReuseIdentifier: NSStringFromClass([_dailyCell class])];
    
    [self.home.tableView registerClass:[_hourlyCell class] forCellReuseIdentifier: NSStringFromClass([_hourlyCell class])];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_sectionNames count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 1;
    } else {
        return [self.daily.dailyArray count];
    }
    
}
# pragma - mark TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        WZDailyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([_dailyCell class])];
        cell.dailyModel = self.daily.dailyArray[indexPath.row];
        cell.backgroundColor =  [UIColor clearColor];
        return cell;
    } else if(indexPath.section == 0){
        WZHourlyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([_hourlyCell class])];
        
        cell.backgroundColor = [UIColor grayColor];
        cell.hourlyArray = _hourly.hourlyArray;
        
        return cell;
    }
    

    return [UITableViewCell new];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 200;
    }else{
        return 24;
    }
    
}



@end
