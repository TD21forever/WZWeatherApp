//
//  WZHourlyTableViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "WZHourlyTableViewCell.h"
#import "Masonry.h"
#import "WZConstant.h"
//@implementation WZHourlyCollectionView
//
//
//@end

@interface WZHourlyTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UITableViewCell* container;

@end

@implementation WZHourlyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _container = self;
        [self createUI];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return self;
}

- (void)createUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.collectionView.scrollEnabled = YES;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.showsHorizontalScrollIndicator = YES;
   
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    
    _collectionView.backgroundColor = [UIColor clearColor];

 

    [_collectionView registerClass:[WZHourlyCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [_container addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self);
        make.top.and.left.equalTo(self).offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
 
}

#pragma -mark CollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_hourlyArray count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WZHourlyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.hourlyModel = _hourlyArray[indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
    
    
}

- (void)setHourlyArray:(NSMutableArray<HourlyModel *> *)hourlyArray{
    NSLog(@"SET HOURLY ARRAY");
    _hourlyArray = hourlyArray;
    [_collectionView reloadData];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
