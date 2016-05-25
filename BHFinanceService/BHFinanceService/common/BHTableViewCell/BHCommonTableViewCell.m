//
//  BHCommonTableViewCell.m
//  bankHuiClient
//
//  Created by 王帅广 on 16/3/23.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHCommonTableViewCell.h"
#import "UIView+BH.h"

@interface BHCommonTableViewCell ()

/**
 *顶部的线
 */
@property (nonatomic,strong) UIView *topLineView;

/**
 *底部的线
 */
@property (nonatomic,strong) UIView *bottomLineView;

@end

@implementation BHCommonTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.topLineStyle = BHCellLineStyleDefault;
        self.bottomLineStyle = BHCellLineStyleDefault;
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.topLineView setOriginY:0];
    [self.bottomLineView setOriginY:self.height - _bottomLineView.height];
    self.topLineStyle = _topLineStyle;
    self.bottomLineStyle = _bottomLineStyle;
}

- (void)setTopLineStyle:(BHCellLineStyle)topLineStyle
{
    _topLineStyle = topLineStyle;
    
    if (topLineStyle == BHCellLineStyleDefault) {
        
        [self.topLineView setOriginX:self.leftfreespace];
        [self.topLineView setWidth:self.width - self.leftfreespace];
        self.topLineView.hidden = NO;
        
    }
    if (topLineStyle == BHCellLineStyleFill) {
        
        [self.topLineView setOriginX:0];
        [self.topLineView setWidth:self.width];
        self.topLineView.hidden = NO;
        
    }
    if (topLineStyle == BHCellLineStyleNone) {
        self.topLineView.hidden = YES;
    }
    
    
}

- (void)setBottomLineStyle:(BHCellLineStyle)bottomLineStyle
{
    _bottomLineStyle = bottomLineStyle;
    
    if (bottomLineStyle == BHCellLineStyleDefault) {
        
        [self.bottomLineView setOriginX:self.leftfreespace];
        [self.bottomLineView setWidth:self.width - self.leftfreespace];
        self.bottomLineView.hidden = NO;
        
    }
    if (bottomLineStyle == BHCellLineStyleFill) {
        
        [self.bottomLineView setOriginX:0];
        [self.bottomLineView setWidth:self.width];
        self.bottomLineView.hidden = NO;
        
    }
    if (bottomLineStyle == BHCellLineStyleNone) {
        self.bottomLineView.hidden = YES;
    }
    
}

- (UIView *)topLineView
{
    if (_topLineView == nil) {
        
        _topLineView = [[UIView alloc] init];
        [_topLineView setHeight:0.5f];
        _topLineView.alpha = 0.4;
        _topLineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_topLineView];
        
    }
    return _topLineView;
}

- (UIView *)bottomLineView
{
    if (_bottomLineView == nil) {
        
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.alpha = 0.4;
        _bottomLineView.backgroundColor = [UIColor grayColor];
        [_bottomLineView setHeight:0.5f];
        [self.contentView addSubview:_bottomLineView];
        
    }
    return _bottomLineView;
}

@end
