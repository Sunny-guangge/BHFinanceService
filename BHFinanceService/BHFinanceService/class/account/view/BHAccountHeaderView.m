//
//  BHAccountHeaderView.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAccountHeaderView.h"

@interface BHAccountHeaderView ()

@property (nonatomic,strong) UIButton *userButton;

@property (nonatomic,strong) UILabel *sumTitleLabel;
@property (nonatomic,strong) UILabel *sumLabel;

@property (nonatomic,strong) UILabel *yesterdayTitleLabel;
@property (nonatomic,strong) UILabel *yesterdaySumLabel;

@property (nonatomic,strong) UILabel *yuETitleLabel;
@property (nonatomic,strong) UILabel *yuESumLabel;

@end

static const NSString *backColor = @"";

@implementation BHAccountHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blueColor];
        
        [self addSubview:self.userButton];
        [self addSubview:self.sumLabel];
        [self addSubview:self.sumTitleLabel];
        [self addSubview:self.yesterdaySumLabel];
        [self addSubview:self.yesterdayTitleLabel];
        [self addSubview:self.yuESumLabel];
        [self addSubview:self.yuETitleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _userButton.frame = CGRectMake(5, 10, 40, 40);
    
    _sumTitleLabel.frame = CGRectMake(0, 50, self.frame.size.width, 14);
    _sumLabel.frame = CGRectMake(0, CGRectGetMaxY(_sumTitleLabel.frame), self.frame.size.width, 35);
    
    _yesterdayTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(_sumLabel.frame) + 20, self.frame.size.width / 2, 18);
    _yesterdaySumLabel.frame = CGRectMake(0, CGRectGetMaxY(_yesterdayTitleLabel.frame) + 5, self.frame.size.width / 2, 18);
    
    _yuETitleLabel.frame = CGRectMake(self.frame.size.width / 2, CGRectGetMaxY(_sumLabel.frame) + 20, self.frame.size.width / 2, 18);
    _yuESumLabel.frame = CGRectMake(self.frame.size.width / 2, CGRectGetMaxY(_yuETitleLabel.frame) + 5, self.frame.size.width / 2, 18);
}

- (void)didClickUserButton
{
    if ([self.delegate respondsToSelector:@selector(clickUserHeader)]) {
        [self.delegate clickUserHeader];
    }
}

#pragma mark - Getter & Setter
- (UIButton *)userButton
{
    if (_userButton == nil) {
        _userButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _userButton.backgroundColor = [UIColor whiteColor];
        [_userButton addTarget:self action:@selector(didClickUserButton) forControlEvents:UIControlEventTouchUpInside];
        [_userButton setImage:[UIImage imageNamed:@"heihei.jpg"] forState:UIControlStateNormal];
    }
    return _userButton;
}

- (UILabel *)sumTitleLabel
{
    if (_sumTitleLabel == nil) {
        _sumTitleLabel = [[UILabel alloc] init];
        _sumTitleLabel.font = [UIFont systemFontOfSize:12];
        _sumTitleLabel.text = @"总资产(元)";
        _sumTitleLabel.textAlignment = NSTextAlignmentCenter;
        _sumTitleLabel.textColor = [UIColor whiteColor];
    }
    return _sumTitleLabel;
}

- (UILabel *)sumLabel
{
    if (_sumLabel == nil) {
        _sumLabel = [[UILabel alloc] init];
        _sumLabel.font = [UIFont systemFontOfSize:30];
        _sumLabel.text = @"9999999999";
        _sumLabel.textAlignment = NSTextAlignmentCenter;
        _sumLabel.textColor = [UIColor whiteColor];
    }
    return _sumLabel;
}

- (UILabel *)yesterdaySumLabel
{
    if (_yesterdaySumLabel == nil) {
        _yesterdaySumLabel = [[UILabel alloc] init];
        _yesterdaySumLabel.font = [UIFont boldSystemFontOfSize:14];
        _yesterdaySumLabel.text = @"99.99";
        _yesterdaySumLabel.textAlignment = NSTextAlignmentCenter;
        _yesterdaySumLabel.textColor = [UIColor whiteColor];
    }
    return _yesterdaySumLabel;
}

- (UILabel *)yesterdayTitleLabel
{
    if (_yesterdayTitleLabel == nil) {
        _yesterdayTitleLabel = [[UILabel alloc] init];
        _yesterdayTitleLabel.font = [UIFont systemFontOfSize:14];
        _yesterdayTitleLabel.text = @"昨日收益(元)";
        _yesterdayTitleLabel.textAlignment = NSTextAlignmentCenter;
        _yesterdayTitleLabel.textColor = [UIColor whiteColor];
    }
    return _yesterdayTitleLabel;
}

- (UILabel *)yuETitleLabel
{
    if (_yuETitleLabel == nil) {
        _yuETitleLabel = [[UILabel alloc] init];
        _yuETitleLabel.font = [UIFont systemFontOfSize:14];
        _yuETitleLabel.text = @"可用余额(元)";
        _yuETitleLabel.textAlignment = NSTextAlignmentCenter;
        _yuETitleLabel.textColor = [UIColor whiteColor];
    }
    return _yuETitleLabel;
}

- (UILabel *)yuESumLabel
{
    if (_yuESumLabel == nil) {
        _yuESumLabel = [[UILabel alloc] init];
        _yuESumLabel.font = [UIFont boldSystemFontOfSize:14];
        _yuESumLabel.text = @"999999.99";
        _yuESumLabel.textAlignment = NSTextAlignmentCenter;
        _yuESumLabel.textColor = [UIColor whiteColor];
    }
    return _yuESumLabel;
}


@end
