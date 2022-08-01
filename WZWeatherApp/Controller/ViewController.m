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
#import "LocationTableVC.h"

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
@property (nonatomic,strong) NSString* currentLocation;

@property (nonatomic,strong) CityModel* cityModel;
@property (nonatomic,strong) CityModel* curCity;

@end

@implementation ViewController


- (void)initService {
    _daily = [DailyDataService new];
    _hourly = [HourlyDataService new];
    _now = [NowDataService new];
}


- (CityModel*)cityModel{
    if(!_cityModel){
        _cityModel = [CityModel new];
    }
    return _cityModel;
}

- (CityModel*)curCity{
    if(!_curCity){
        _curCity = self.cityModel.cityArray[0];
    }
    return _curCity;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initService];
    self.navigationController.navigationBar.translucent = NO;
    
 
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.home = [HomeView new];
    self.home.frame = CGRectMake(0, 0, Width, Height);
    [self.view addSubview:self.home];
    
    self.home.tableView.delegate = self;
    self.home.tableView.dataSource = self;
    
    self.home.headerView.curCity = self.curCity;

    _dailyCell = [WZDailyTableViewCell new];
    _hourlyCell = [WZHourlyTableViewCell new];
    
    [self.home.tableView registerClass:[_dailyCell class] forCellReuseIdentifier: NSStringFromClass([_dailyCell class])];
    
    [self.home.tableView registerClass:[_hourlyCell class] forCellReuseIdentifier: NSStringFromClass([_hourlyCell class])];
    
    [self setupNavigationBarItems];
    
    [self fetchData];
   
    
}

- (void)fetchData{
    [_daily fetchData:self.curCity callback:^{
        NSLog(@"current city %@",self.daily.dailyArray);
        self->_home.headerView.dailyModel = self->_daily.dailyArray[0];
        [self->_home.tableView reloadData];
    }];
    
    [_hourly fetchData:self.curCity callback:^{
        [self->_home.tableView reloadData];
    }];

    
    [_now fetchData:self.curCity callback:^{
        self->_home.headerView.nowModel = self->_now.nowModel;
        [self->_home.tableView reloadData];
    }];
}

- (void)setupNavigationBarItems{
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"location.magnifyingglass"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeftBtn:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    

}

- (void)pressLeftBtn:(UIBarButtonItem*)btn{
    LocationTableVC * locationVC = [[LocationTableVC alloc]init];
    [self.navigationController pushViewController:locationVC animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
        
        cell.backgroundColor = [UIColor clearColor];
        cell.hourlyArray = _hourly.hourlyArray;
        
        return cell;
    }
    

    return [UITableViewCell new];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 120;
    }else{
        return 44;
    }
    
}



@end
