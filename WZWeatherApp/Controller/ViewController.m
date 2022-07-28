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

#define Height [UIScreen mainScreen].bounds.size.height
#define Width [UIScreen mainScreen].bounds.size.width

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) HomeView* home;
@property (nonatomic,strong) DailyDataService* daily;
@end

@implementation ViewController


- (void)initService {
    _daily = [DailyDataService new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initService];
    
    [_daily fetchData:^{
        NSLog(@"%@",self->_daily.dailyArray);
        [self->_home.tableView reloadData];
    }];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.home = [HomeView new];
    self.home.frame = CGRectMake(0, 0, Width, Height);
    [self.view addSubview:self.home];
    self.home.tableView.delegate = self;
    self.home.tableView.dataSource = self;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.daily.dailyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"cell";
    WZDailyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor = [UIColor redColor];
    if(!cell){
        cell = [[WZDailyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.dailyModel = self.daily.dailyArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
