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


@end

@implementation WZHourlyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        
//        self.backgroundColor = [UIColor grayColor];
//        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];

//        UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//        UIVisualEffectView * blurEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
//        blurEffectView.frame = self.contentView.bounds;
//        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        [self.contentView addSubview:blurEffectView];
        [self createUI];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return self;
}

- (void)createUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 100);
    layout.sectionInset = UIEdgeInsetsMake(10,10,10,10);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

   
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];

    [_collectionView registerClass:[WZHourlyCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [self.contentView addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self);
        make.top.and.left.equalTo(self);
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


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WZHourlyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.hourlyModel = _hourlyArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}

- (void)setHourlyArray:(NSMutableArray<HourlyModel *> *)hourlyArray{
    _hourlyArray = hourlyArray;
    [_collectionView reloadData];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
