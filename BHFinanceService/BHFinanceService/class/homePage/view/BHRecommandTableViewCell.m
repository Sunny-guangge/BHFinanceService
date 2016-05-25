//
//  BHRecommandTableViewCell.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/24.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHRecommandTableViewCell.h"
#import "constant.h"
#import "BHRecommandCollectionViewCell.h"

@interface BHRecommandTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIButton *leftButton;

@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation BHRecommandTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        self.leftButton.hidden = YES;
        self.rightButton.hidden = YES;
        
        [self.collectionView registerClass:[BHRecommandCollectionViewCell class] forCellWithReuseIdentifier:@"BHRecommandCollectionViewCell"];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _collectionView.frame = CGRectMake(0, 0, SCREEHW, 280);
    
    
    if (self.array.count == 1) {
        self.leftButton.hidden = YES;
        self.rightButton.hidden = YES;
    }else if (self.array.count > 1){
        self.leftButton.hidden = YES;
        self.rightButton.hidden = NO;
    }else
    {
        self.leftButton.hidden = YES;
        self.rightButton.hidden = YES;
    }
    
    
    _leftButton.frame = CGRectMake(20, self.frame.size.height / 2 - 60, 40, 40);
    
    _rightButton.frame = CGRectMake(self.frame.size.width - 40, self.frame.size.height / 2 - 60, 40, 40);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.dataArray.count;
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BHRecommandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BHRecommandCollectionViewCell" forIndexPath:indexPath];
    
//    cell.tender = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x >= self.frame.size.width) {
        
        if (scrollView.contentOffset.x + self.frame.size.width >= scrollView.contentSize.width) {
            self.leftButton.hidden = NO;
            self.rightButton.hidden = YES;
        }else
        {
            self.leftButton.hidden = NO;
            self.rightButton.hidden = NO;
        }
    }else
    {
        if (scrollView.contentOffset.x + self.frame.size.width > scrollView.contentSize.width) {
            self.leftButton.hidden = YES;
            self.rightButton.hidden = YES;
        }else
        {
            self.leftButton.hidden = YES;
            self.rightButton.hidden = NO;
        }
    }
}

#pragma mark - Getter & Setter
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        flowLayout.minimumLineSpacing = 0;
        [flowLayout setItemSize:CGSizeMake(SCREEHW,280)];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
    }
    return _collectionView;
}

- (UIButton *)leftButton
{
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor redColor];
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.backgroundColor = [UIColor redColor];
        
    }
    return _rightButton;
}

- (NSMutableArray *)array
{
    if (_array == nil) {
        
        _array = [NSMutableArray arrayWithObjects:@"",@"",@"",nil];
        
    }
    
    return _array;
}

@end
