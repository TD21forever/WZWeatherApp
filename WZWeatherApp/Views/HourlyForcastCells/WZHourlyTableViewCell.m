//
//  WZHourlyTableViewCell.m
//  WZWeatherApp
//
//  Created by T D on 2022/7/29.
//

#import "WZHourlyTableViewCell.h"
#import "Masonry.h"
#import "WZConstant.h"

@interface WZHourlyTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@end

@implementation WZHourlyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        [self createUI];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [self.collectionView registerClass:[WZHourlyCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    }
    return self;
}



- (void)createUI {
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.collectionView.showsHorizontalScrollIndicator = NO;

    [self.contentView addSubview:_collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self);
        make.top.and.left.equalTo(self);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
 
}

#pragma mark- CollectionView

- (UICollectionView*)collectionView{
    if(!_collectionView){
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(80, 100);
        layout.sectionInset = UIEdgeInsetsMake(10,10,10,10);
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}

#pragma mark- UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_hourlyArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WZHourlyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.hourlyModel = _hourlyArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

#pragma mark - setter

- (void)setHourlyArray:(NSMutableArray<HourlyModel *> *)hourlyArray{
    _hourlyArray = hourlyArray;
    [_collectionView reloadData];
}



@end
