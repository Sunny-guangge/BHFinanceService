//
//  BHTotalSumView.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/24.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHTotalSumView.h"
#import "constant.h"

@interface BHTotalSumView ()

@property (nonatomic,strong) UILabel *moneySumLabel;
@property (nonatomic,strong) UILabel *moneySumNumLabel;

@property (nonatomic,strong) UILabel *forPersonLabel;
@property (nonatomic,strong) UILabel *forPersonNumLabel;

@property (nonatomic,strong) UILabel *userLabel;
@property (nonatomic,strong) UILabel *userNumLabel;

@end

@implementation BHTotalSumView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.moneySumLabel];
        [self addSubview:self.moneySumNumLabel];
        [self addSubview:self.forPersonLabel];
        [self addSubview:self.forPersonNumLabel];
        [self addSubview:self.userLabel];
        [self addSubview:self.userNumLabel];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat labelW = SCREEHW / 3;
    
    _moneySumLabel.frame = CGRectMake(0, 5, labelW, 20);
    _moneySumNumLabel.frame = CGRectMake(0, CGRectGetMaxY(_moneySumLabel.frame) + 5, labelW, 20);
    
    _forPersonLabel.frame = CGRectMake(labelW, 5, labelW, 20);
    _forPersonNumLabel.frame = CGRectMake(labelW, CGRectGetMaxY(_forPersonLabel.frame) + 5, labelW, 20);
    
    _userLabel.frame = CGRectMake(labelW * 2, 5, labelW, 20);
    _userNumLabel.frame = CGRectMake(labelW * 2, CGRectGetMaxY(_userLabel.frame) + 5, labelW, 20);
    
}

- (UILabel *)moneySumLabel
{
    if (_moneySumLabel == nil) {
        _moneySumLabel = [[UILabel alloc] init];
        _moneySumLabel.text = @"平台投资总额";
        _moneySumLabel.textColor = [UIColor grayColor];
        _moneySumLabel.textAlignment = NSTextAlignmentCenter;
        _moneySumLabel.font = [UIFont systemFontOfSize:12];
    }
    return _moneySumLabel;
}

- (UILabel *)moneySumNumLabel
{
    if (_moneySumNumLabel == nil) {
        _moneySumNumLabel = [[UILabel alloc] init];
        _moneySumNumLabel.textAlignment = NSTextAlignmentCenter;
        _moneySumNumLabel.textColor = [UIColor blueColor];
        _moneySumNumLabel.text = @"9999999999元";
        _moneySumNumLabel.font = [UIFont systemFontOfSize:12];
    }
    return _moneySumNumLabel;
}

- (UILabel *)forPersonLabel
{
    if (_forPersonLabel == nil) {
        _forPersonLabel = [[UILabel alloc] init];
        _forPersonLabel.text = @"累计为用户赚取";
        _forPersonLabel.textColor = [UIColor grayColor];
        _forPersonLabel.font = [UIFont systemFontOfSize:12];
        _forPersonLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _forPersonLabel;
}

- (UILabel *)forPersonNumLabel
{
    if (_forPersonNumLabel == nil) {
        _forPersonNumLabel = [[UILabel alloc] init];
        _forPersonNumLabel.textAlignment = NSTextAlignmentCenter;
        _forPersonNumLabel.textColor = [UIColor blueColor];
        _forPersonNumLabel.text = @"999999999元";
        _forPersonNumLabel.font = [UIFont systemFontOfSize:12];
    }
    return _forPersonNumLabel;
}

- (UILabel *)userLabel
{
    if (_userLabel == nil) {
        _userLabel = [[UILabel alloc] init];
        _userLabel.text = @"加入人数";
        _userLabel.textAlignment = NSTextAlignmentCenter;
        _userLabel.textColor = [UIColor grayColor];
        _userLabel.font = [UIFont systemFontOfSize:12];
    }
    return _userLabel;
}

- (UILabel *)userNumLabel
{
    if (_userNumLabel == nil) {
        _userNumLabel = [[UILabel alloc] init];
        _userNumLabel.textColor = [UIColor blueColor];
        _userNumLabel.textAlignment = NSTextAlignmentCenter;
        _userNumLabel.font = [UIFont systemFontOfSize:12];
        _userNumLabel.text = @"9999999999人";
    }
    return _userNumLabel;
}

@end
