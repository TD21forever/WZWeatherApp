//
//  LocationTableVC.m
//  WZWeatherApp
//
//  Created by T D on 2022/8/1.
//

#import "LocationTableVC.h"
#import "CityModel.h"
#import "WZConstant.h"
#import "HomeViewController.h"
#import "WZHeaderTextView.h"

@interface LocationTableVC ()<UISearchResultsUpdating>
@property (nonatomic,strong) CityModel * cityModel;
@property (nonatomic,strong) UILocalizedIndexedCollation* collation;
@property (nonatomic,strong) NSMutableArray * sectionArray;
@property (nonatomic,strong) NSMutableArray<CityModel*> * displayArray;
@property (nonatomic,strong) UISearchController* searchController;
@property (nonatomic,assign) BOOL isSearch;
@end

@implementation LocationTableVC


- (void)viewDidLoad {
    _isSearch = NO;
    [super viewDidLoad];
    [self setupTableView];
    [self fetchSectionData];
    [self.tableView reloadData];
    self.title = @"城市选择";
    
    
    
  
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    


}

- (UISearchController*)searchController{
    if(!_searchController){
        
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.obscuresBackgroundDuringPresentation = NO;
        _searchController.searchBar.placeholder = @"搜索城市";
        _searchController.definesPresentationContext = YES;
        
    }
    return _searchController;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    if([searchController.searchBar.text length] == 0){

        _isSearch = NO;
    } else{
        _isSearch = YES;
        [_displayArray removeAllObjects];
        [self filterArrayForSearchText:searchController.searchBar.text];
    }
  
    [self.tableView reloadData];
}

- (void)filterArrayForSearchText:(NSString*)text{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.cityChineseName contains [cd] %@",self.searchController.searchBar.text];
    _displayArray = [[NSMutableArray alloc]initWithArray:[[CityModel getCityArray] filteredArrayUsingPredicate:predicate]];
}

- (void)fetchSectionData{
    if(!_collation){
        _collation = [UILocalizedIndexedCollation currentCollation];
    }
    if(!_cityModel){
        _cityModel = [CityModel new];
    }
    if(!_displayArray){
        _displayArray = [[CityModel getCityArray] mutableCopy];
    }
    NSArray * titles = _collation.sectionTitles;
    NSMutableArray * sectionArray = [NSMutableArray arrayWithCapacity:titles.count];
    for(int i = 0;i < titles.count; i++){
        NSMutableArray * subArr = [NSMutableArray array];
        [sectionArray addObject:subArr];
    }
    for (CityModel * city in _displayArray) {
        NSInteger section = [_collation sectionForObject:city collationStringSelector:@selector(cityChineseName)];
        NSMutableArray * subArray = sectionArray[section];
        [subArray addObject:city];
    }
    for(NSMutableArray *arr in sectionArray){
        NSArray *sortArr = [_collation sortedArrayFromArray:arr collationStringSelector:@selector(cityChineseName)];
        [arr removeAllObjects];
        [arr addObjectsFromArray:sortArr];
    }
    _sectionArray = sectionArray;
    
}

- (void)setupTableView{
    //定义tableview右侧section的外观
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    //文字颜色
    self.tableView.sectionIndexColor = [UIColor blackColor];
    //背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    //触摸section区域时候的背景颜色 _tableview.sectionIndexTrackingBackgroundColor = [UIColor greenColor];
    self.tableView.sectionIndexMinimumDisplayRowCount = 13;
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.searchController =  self.searchController;
    
    
    UILabel * label = [UILabel new];
    WZHeaderTextView* header = [WZHeaderTextView new];
    label.text = @"hello";
    self.tableView.tableHeaderView = header;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(!_isSearch)
        return _sectionArray.count;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(!_isSearch)
        return [[_sectionArray objectAtIndex:section] count];
    return _displayArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(!_isSearch)
        return [[_collation sectionTitles]objectAtIndex:section];
    return @"";
        
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!_isSearch){
        CityModel * item = _sectionArray[indexPath.section][indexPath.row];
        cell.textLabel.text = item.cityChineseName;
        return cell;
    } else {
        CityModel * item = _displayArray[indexPath.row];
        cell.textLabel.text = item.cityChineseName;
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(!_isSearch){
        CityModel * city = self.sectionArray[indexPath.section][indexPath.row];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateCityName" object:city];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
     
        CityModel * city = self.displayArray[indexPath.row];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateCityName" object:city];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
  
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray* sections = [_collation.sectionTitles mutableCopy];
    //往索引数组的开始处添加一个放大镜🔍 放大镜是系统定义好的一个常量字符串表示UITableViewIndexSearch 当然除了放大镜外也可以添加其他文字
//    [sections insertObject:UITableViewIndexSearch  atIndex:0];
    if(!_isSearch)
        return sections;
    return nil;
}
@end
