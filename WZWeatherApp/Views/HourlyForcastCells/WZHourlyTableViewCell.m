//
//  WZHourlyTableViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "WZHourlyTableViewCell.h"
#import "Masonry.h"
//@implementation WZHourlyCollectionView
//
//
//@end

@interface WZHourlyTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UITableViewCell* container;

@end

@implementation WZHourlyTableViewCell

- (instancetype)init{
    if(self = [super init]){
        _container = self;
        [self createUI];
    }
    return self;
}

- (void)createUI {
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    
    [_container addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
    
    [_collectionView registerClass:[WZHourlyCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
}

#pragma -mark CollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_hourlyArray count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    WZHourlyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.hourlyModel = _hourlyArray[indexPath.row];
    return cell;
    
    
    
}

- (void)setHourlyArray:(NSMutableArray<HourlyModel *> *)hourlyArray{
    _hourlyArray = hourlyArray;
    [_collectionView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
