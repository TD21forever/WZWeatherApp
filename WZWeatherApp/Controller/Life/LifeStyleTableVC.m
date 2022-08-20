//
//  LifeStyleTableVC.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/3.
//

#import "LifeStyleTableVC.h"
#import "CityModel.h"
#import "LifeStyleModel.h"
#import "LifeStyleDataService.h"
#import "WZConstant.h"
#import "LifeStyleTableViewCell.h"

@interface LifeStyleTableVC ()
@property (nonatomic,strong) NSMutableArray<LifeStyleModel*>* lifeStyleArray;
@property (nonatomic,strong) LifeStyleDataService* life;

@end

@implementation LifeStyleTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
 
    [self.tableView registerClass:[LifeStyleTableViewCell class] forCellReuseIdentifier:NSStringFromClass([LifeStyleTableViewCell class])];
    
    
}

- (void)fetchData{
    
    [self.life fetchData:self.curCity callback:^(NSMutableArray * _Nonnull lifeStyleArray) {
        WeakSelf
        weakSelf.lifeStyleArray = lifeStyleArray;
        [weakSelf.tableView reloadData];
    }];
    
}

- (LifeStyleDataService*)life{
    if(!_life){
        _life = [LifeStyleDataService new];
    }
    return _life;
}

- (NSMutableArray*)lifeSytleArray{
    if(!_lifeStyleArray){
        _lifeStyleArray = [NSMutableArray new];
    }
    return _lifeStyleArray;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.lifeStyleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LifeStyleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LifeStyleTableViewCell class])];
    cell.lifeStyleModel = _lifeStyleArray[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}


- (void)setCurCity:(CityModel *)curCity{
    _curCity = curCity;
    [self fetchData];
}

@end
