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
@property (nonatomic,strong) UISearchController* searchController;
@property (nonatomic,strong) UILocalizedIndexedCollation* collation;
@property (nonatomic,strong) NSMutableArray * sectionArray;
@property (nonatomic,strong) NSMutableArray<CityModel*> * displayArray;
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

// 城市的筛选
- (void)filterArrayForSearchText:(NSString*)text{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.cityChineseName contains [cd] %@",self.searchController.searchBar.text];
    _displayArray = [[NSMutableArray alloc]initWithArray:[[CityModel getCityArray] filteredArrayUsingPredicate:predicate]];
}

// 按照A-Z组织数据
- (void)fetchSectionData{
    if(!_collation){
        _collation = [UILocalizedIndexedCollation currentCollation];
    }
    if(!_displayArray){
        _displayArray = [[CityModel getCityArray] mutableCopy];
    }
    //Provides the list of section titles used to group results (e.g. A-Z,# in US/English)
    NSArray * titles = _collation.sectionTitles;
    // secitonArray 二维数组
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
    
    //文字颜色
    self.tableView.sectionIndexColor = [UIColor blackColor];
    //背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexMinimumDisplayRowCount = 13;
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.searchController =  self.searchController;
    
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
    CityModel * city;
    if(!_isSearch){
        city = self.sectionArray[indexPath.section][indexPath.row];
    } else {
        city = self.displayArray[indexPath.row];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateCityName" object:city];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray* sections = [_collation.sectionTitles mutableCopy];
    if(!_isSearch)
        return sections;
    return nil;
}
@end
