//
//  ViewController.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/27.
//

#import "HomeViewController.h"
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
#import <AVKit/AVKit.h>
#import "WZBackgroundVideoView.h"
#import "LifeStyleTableVC.h"
#import "LocationManager.h"
#import "MJRefresh.h"
#import "YYCache.h"

#define DailyCacheKey @"DailyCacheKey"
#define HourlyCacheKey @"HourlyCacheKey"
#define NowCacheKey @"NowCacheKey"
#define CurCityCacheKey @"CurCityCacheKey"


@interface HomeViewController () <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UITabBarControllerDelegate>

#pragma mark - Model Service
@property (nonatomic,strong) DailyDataService* daily;
@property (nonatomic,strong) HourlyDataService* hourly;
@property (nonatomic,strong) NowDataService* now;

#pragma mark - Views
@property (nonatomic,strong) HomeView* home;
@property (nonatomic,strong) WZDailyTableViewCell * dailyCell;
@property (nonatomic,strong) WZHourlyTableViewCell * hourlyCell;

#pragma mark - Store
@property (nonatomic,strong) CityModel* cityModel;
@property (nonatomic,strong) CityModel* curCity;
@property (nonatomic,strong) CityModel* locationCity;
@property (nonatomic,strong) LocationTableVC* locationVC;
@property (nonatomic,strong) NSMutableArray<DailyModel*>* dailyArray;
@property (nonatomic,strong) NSMutableArray<HourlyModel*>* hourlyArray;
@property (nonatomic,strong) NSMutableArray* tableViewData;
@property (nonatomic,strong) NowModel* nowModel;
@property (nonatomic,assign) Boolean isCleanMode;

@property (nonatomic,strong) NSString* currentLocation;
@property (nonatomic,strong) MJRefreshNormalHeader * mjHeader;

#pragma mark - Cache
@property (nonatomic,strong) YYCache* dataCache;

@property (nonatomic,weak) id delegate;
@end

@implementation HomeViewController



#pragma mark - Tabbar Controller
- (LocationTableVC*)locationVC{
    if(!_locationVC){
        _locationVC = [LocationTableVC new];
    }
    return _locationVC;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if([viewController isKindOfClass:[LifeStyleTableVC class]]){
        LifeStyleTableVC* lifeStyleVC = (LifeStyleTableVC*)viewController;
        lifeStyleVC.curCity = self.curCity;
    }
}

#pragma mark - 初始化服务

- (void)initService {
    _daily = [DailyDataService new];
    _hourly = [HourlyDataService new];
    _now = [NowDataService new];
}

#pragma mark - 初始化模型

- (void)initStores {
 
    self.cityModel = [CityModel new];
    self.dailyArray = [NSMutableArray new];
    self.hourlyArray = [NSMutableArray new];
    
}



- (CityModel*)curCity{
    if(!_curCity){
        
        if([self.dataCache.diskCache containsObjectForKey:CurCityCacheKey]){
            _curCity = (CityModel*) [self.dataCache.diskCache objectForKey:CurCityCacheKey];
        } else {
            _curCity = [CityModel getCityArray][0];
        }
        LifeStyleTableVC* lifestyleVC =  self.tabBarController.childViewControllers[1];
        lifestyleVC.curCity = _curCity;
    
    }
    return _curCity;
}



- (YYCache*)dataCache{
    if(!_dataCache){
        _dataCache = [YYCache cacheWithName:@"weatherDataCache"];
        _dataCache.memoryCache.shouldRemoveAllObjectsOnMemoryWarning = YES;
    }
    return _dataCache;
}

#pragma mark - MJRefresh

- (MJRefreshNormalHeader*)mjHeader{
    if (!_mjHeader){
        WeakSelf
        _mjHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf fetchDataWithCache:NO];
        }];

    }
    return _mjHeader;

}

#pragma mark - 初始化首页UI
- (HomeView*)home{
    if(!_home){
        _home = [[HomeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _home.delegate = self;
        _home.dataSource = self;
        [_home registerClass: [WZDailyTableViewCell class] forCellReuseIdentifier: NSStringFromClass([WZDailyTableViewCell class])];
        
        [_home registerClass: [WZHourlyTableViewCell class] forCellReuseIdentifier: NSStringFromClass([WZHourlyTableViewCell class])];
        
        _home.mj_header = self.mjHeader;
            
        [self.view addSubview:_home];
    }
   
    return _home;
}

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = NO;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initService];
    [self initStores];
    
    [self fetchDataWithCache:YES];
    
    [self setupNavigationBarItems];
 
   
    self.tabBarController.delegate = self;
    self.isCleanMode = NO;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchCityNameDidSelect:) name:@"updateCityName" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationDidUpdated:) name:@"updateLocation" object:nil];
    
 
    [[LocationManager shared] setupCurLocation];
    

    
    
}

- (void)locationDidUpdated:(NSNotification *)notify{
    NSLog(@"update location");
    NSString* cityName = notify.object;
    if([cityName isEqualToString:@""]){
        return;
    }
    for(CityModel* city in [CityModel getCityArray]){
        if([cityName containsString:city.cityChineseName]){
            self.curCity = city;
            self.locationCity = city;
            break;
        }
    }
    
    LifeStyleTableVC* lifestyleVC =  self.tabBarController.childViewControllers[1];
    lifestyleVC.curCity = self.curCity;
    
    [self fetchDataWithCache:NO];
    
}

- (void)searchCityNameDidSelect:(NSNotification *)notify{
    CityModel * cityModel = notify.object;
    for (CityModel* city in [CityModel getCityArray]) {
        if([city.cityChineseName isEqualToString:cityModel.cityChineseName]){
            self.curCity = city;
            [self fetchDataWithCache:NO];
            return;
        }
    }
}


- (void)fetchDataWithCache:(Boolean)withCache{
    
    dispatch_group_t fetchDataTaskGroup = dispatch_group_create();

    // 使用Cache的数据
    if (withCache && [self.dataCache.diskCache containsObjectForKey:DailyCacheKey]
){
      
        self.dailyArray = (NSMutableArray<DailyModel*>*)[self.dataCache.diskCache objectForKey:DailyCacheKey];
        self.hourlyArray = (NSMutableArray<HourlyModel*>*)[self.dataCache.diskCache objectForKey:HourlyCacheKey];
        self.nowModel = (NowModel*)[self.dataCache.diskCache objectForKey:NowCacheKey];
    
        
    } else {
        // DailyModel Data
        [self.dataCache.diskCache removeAllObjects];
        dispatch_group_enter(fetchDataTaskGroup);
        [self.dataCache.diskCache setObject:self.curCity forKey:CurCityCacheKey];
        [self.daily fetchData:self.curCity callback:^(NSMutableArray *dailyArray) {
                WeakSelf
            weakSelf.dailyArray = dailyArray;
            [weakSelf.dataCache.diskCache setObject:dailyArray forKey:DailyCacheKey];
            dispatch_group_leave(fetchDataTaskGroup);
        }];
        
        // HourlyModel Data
        dispatch_group_enter(fetchDataTaskGroup);
        [self.hourly fetchData:self.curCity callback:^(NSMutableArray * _Nonnull hourlyArray) {
                WeakSelf
                weakSelf.hourlyArray = hourlyArray;
            [weakSelf.dataCache.diskCache setObject:hourlyArray forKey:HourlyCacheKey];
            dispatch_group_leave(fetchDataTaskGroup);
        }];
        dispatch_group_enter(fetchDataTaskGroup);
        
        // NowModel Data
        [self.now fetchData:self.curCity callback:^(NowModel * _Nonnull nowModel){
           
                WeakSelf
            weakSelf.nowModel = nowModel;
            [weakSelf.dataCache.diskCache setObject:nowModel forKey:NowCacheKey];

            dispatch_group_leave(fetchDataTaskGroup);
        }];
        
    }
    
    dispatch_group_notify(fetchDataTaskGroup, dispatch_get_main_queue(), ^{
        WeakSelf
        weakSelf.home.estimatedRowHeight = 0;
        weakSelf.home.estimatedSectionHeaderHeight = 0;
        weakSelf.home.estimatedSectionFooterHeight = 0;
        [weakSelf.home reloadData];
        weakSelf.home.headerView.curCity = self.curCity;
        weakSelf.navigationItem.title = self.curCity.cityChineseName;
        [weakSelf.home.mj_header endRefreshing];
    });

}


#pragma mark - NavigationView
- (void)setupNavigationBarItems{
    
    UIImageSymbolConfiguration* config = [UIImageSymbolConfiguration configurationWithHierarchicalColor:[UIColor blackColor]];
    // right Button
    UIImage* rightButtonImage = [UIImage systemImageNamed:@"location.magnifyingglass" withConfiguration:config];
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithImage:rightButtonImage style:UIBarButtonItemStyleDone target:self action:@selector(pressRightBtn:)];
    self.navigationItem.rightBarButtonItem= rightButton;
    
    // left Button
    UIImage* leftButtonImage = [UIImage systemImageNamed:@"drop" withConfiguration:config];
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc]initWithImage:leftButtonImage style:UIBarButtonItemStyleDone target:self action:@selector(pressLeftBtn:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UINavigationBarAppearance* appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.standardAppearance = appearance;
    self.navigationItem.scrollEdgeAppearance = appearance;
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.backButtonTitle = @"返回";
    
}

- (void)pressLeftBtn:(UIBarButtonItem*)btn{
    self.isCleanMode = !self.isCleanMode;
    UIImageSymbolConfiguration* config = [UIImageSymbolConfiguration configurationWithHierarchicalColor:[UIColor blackColor]];
    if (self.isCleanMode){
        self.navigationItem.leftBarButtonItem.image = [UIImage systemImageNamed:@"drop.fill" withConfiguration:config];
    } else {
        self.navigationItem.leftBarButtonItem.image = [UIImage systemImageNamed:@"drop" withConfiguration:config];
    }
   
    
}
- (void)pressRightBtn:(UIBarButtonItem*)btn{
    [self.navigationController pushViewController:self.locationVC animated:YES];
    
}
#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 1;
    } else {
        return [self.dailyArray count];
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        
        WZDailyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WZDailyTableViewCell class])];
        cell.dailyModel = self.dailyArray[indexPath.row];
        return cell;
    } else if(indexPath.section == 0){
        
        WZHourlyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WZHourlyTableViewCell class])];
        cell.hourlyArray = self.hourlyArray;
        
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

- (void)setDailyArray:(NSMutableArray<DailyModel *> *)dailyArray{
    if(dailyArray.count >= 1){
        self.home.headerView.dailyModel = dailyArray[0];
        [dailyArray removeObjectAtIndex:0];
    }
    _dailyArray = dailyArray;
}

- (void)setNowModel:(NowModel *)nowModel{
    _nowModel =  nowModel;
    self.home.headerView.nowModel = nowModel;
    [self.home.backgroundVideoView update:nowModel.text with:@"day"];
}
- (void)setIsCleanMode:(Boolean)isCleanMode{
    _isCleanMode = isCleanMode;
    if (self.home.isCleanMode != isCleanMode) self.home.isCleanMode = isCleanMode;
}

@end
