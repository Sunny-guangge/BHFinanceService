//
//  BHRecommandCollectionViewCell.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/24.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHRecommandCollectionViewCell.h"
#import "constant.h"

@interface BHRecommandCollectionViewCell ()

@property (nonatomic,strong) UIView *circleView;
@property (nonatomic,strong) UILabel *circleLiLVLabel;
@property (nonatomic,strong) UILabel *circleBaifenLabel;
@property (nonatomic,strong) UIView *circleLineView;
@property (nonatomic,strong) UILabel *circleMonthLabel;

@property (nonatomic,strong) UIImageView *newerImageView;
@property (nonatomic,strong) UILabel *newerLabel;

@property (nonatomic,strong) UIImageView *oneImageView;
@property (nonatomic,strong) UILabel *oneLabel;

@property (nonatomic,strong) UIButton *vestButton;

@end


static const CGFloat circleW = 150; //中间圆的宽度


@implementation BHRecommandCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.circleView];
        [self.circleView addSubview:self.circleLineView];
        [self.circleView addSubview:self.circleLiLVLabel];
        [self.circleView addSubview:self.circleMonthLabel];
        [self.circleView addSubview:self.circleBaifenLabel];
        
        [self addSubview:self.newerLabel];
        [self addSubview:self.newerImageView];
        [self addSubview:self.oneLabel];
        [self addSubview:self.oneImageView];
        [self addSubview:self.vestButton];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _circleView.frame = CGRectMake((SCREEHW - circleW)/2, 10, circleW, circleW);
    _circleLiLVLabel.frame = CGRectMake(0, 20, circleW, 15);
    _circleBaifenLabel.frame = CGRectMake(0, CGRectGetMaxY(_circleLiLVLabel.frame) + 5, circleW, 60);
    _circleLineView.frame = CGRectMake(30, CGRectGetMaxY(_circleBaifenLabel.frame) + 5, 90, 0.5);
    _circleMonthLabel.frame = CGRectMake(0, CGRectGetMaxY(_circleLineView.frame) + 5, circleW, 20);
    
    
    _newerLabel.frame = CGRectMake(SCREEHW / 2 - 80, CGRectGetMaxY(_circleView.frame) + 20, 80, 20);
    _newerImageView.frame = CGRectMake(SCREEHW / 2 - 105, CGRectGetMaxY(_circleView.frame) + 20, 20, 20);
    
    _oneImageView.frame = CGRectMake(SCREEHW / 2 + 10, CGRectGetMaxY(_circleView.frame) + 20, 20, 20);
    _oneLabel.frame = CGRectMake(CGRectGetMaxX(_oneImageView.frame) + 5, CGRectGetMaxY(_circleView.frame) + 20, 100, 20);
    
    
    _vestButton.frame = CGRectMake(SCREEHW / 2 - 120, CGRectGetMaxY(_circleView.frame) + 60, 240, 40);
}

- (void)setTender:(BHTender *)tender
{
    _tender = tender;
    
    
    
}


#pragma mark - Getter & Setter
- (UIView *)circleView
{
    if (_circleView == nil) {
        _circleView = [[UIView alloc] init];
        _circleView.layer.masksToBounds = YES;
        _circleView.layer.cornerRadius = 75;
        _circleView.backgroundColor = [UIColor blueColor];
    }
    return _circleView;
}

- (UIView *)circleLineView
{
    if (_circleLineView == nil) {
        _circleLineView = [[UIView alloc] init];
        _circleLineView.backgroundColor = [UIColor whiteColor];
    }
    return _circleLineView;
}

- (UILabel *)circleBaifenLabel
{
    if (_circleBaifenLabel == nil) {
        _circleBaifenLabel = [[UILabel alloc] init];
        _circleBaifenLabel.textColor = [UIColor whiteColor];
        _circleBaifenLabel.font = [UIFont systemFontOfSize:25];
        _circleBaifenLabel.textAlignment = NSTextAlignmentCenter;
        NSString * aString = @"7.5%";
        
        //富文本对象
        NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:aString];
        
        //富文本样式
        [aAttributedString addAttribute:NSForegroundColorAttributeName  //文字颜色
                                  value:[UIColor whiteColor]
                                  range:NSMakeRange(0, aAttributedString.length - 1)];
        
        [aAttributedString addAttribute:NSFontAttributeName             //文字字体
                                  value:[UIFont systemFontOfSize:50]
                                  range:NSMakeRange(0, aAttributedString.length - 1)];
        
        _circleBaifenLabel.attributedText = aAttributedString;
        
    }
    return _circleBaifenLabel;
}

- (UILabel *)circleMonthLabel
{
    if (_circleMonthLabel == nil) {
        _circleMonthLabel = [[UILabel alloc] init];
        _circleMonthLabel.textColor = [UIColor whiteColor];
        _circleMonthLabel.font = [UIFont systemFontOfSize:12];
        _circleMonthLabel.text = @"项目期限0.5个月";
        _circleMonthLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _circleMonthLabel;
}

- (UILabel *)circleLiLVLabel
{
    if (_circleLiLVLabel == nil) {
        _circleLiLVLabel = [[UILabel alloc] init];
        _circleLiLVLabel.text = @"年化利率";
        _circleLiLVLabel.font = [UIFont systemFontOfSize:12];
        _circleLiLVLabel.textColor = [UIColor whiteColor];
        _circleLiLVLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _circleLiLVLabel;
}

- (UILabel *)newerLabel
{
    if (_newerLabel == nil) {
        _newerLabel = [[UILabel alloc] init];
        _newerLabel.text = @"新用户专享";
        _newerLabel.textColor = [UIColor grayColor];
        _newerLabel.font = [UIFont systemFontOfSize:12];
    }
    return _newerLabel;
}

- (UIImageView *)newerImageView
{
    if (_newerImageView == nil) {
        _newerImageView = [[UIImageView alloc] init];
        _newerImageView.backgroundColor = [UIColor redColor];
    }
    return _newerImageView;
}

- (UIImageView *)oneImageView
{ 
    if (_oneImageView == nil) {
        _oneImageView = [[UIImageView alloc] init];
        _oneImageView.backgroundColor = [UIColor brownColor];
    }
    return _oneImageView;
}

- (UILabel *)oneLabel
{
    if (_oneLabel == nil) {
        _oneLabel = [[UILabel alloc] init];
        _oneLabel.text = @"一次性还本付息";
        _oneLabel.textColor = [UIColor grayColor];
        _oneLabel.font = [UIFont systemFontOfSize:12];
    }
    return _oneLabel;
}

- (UIButton *)vestButton
{
    if (_vestButton == nil) {
        _vestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_vestButton setTitle:@"立即投资" forState:UIControlStateNormal];
        [_vestButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _vestButton.backgroundColor = [UIColor grayColor];
        _vestButton.layer.masksToBounds = YES;
        _vestButton.layer.cornerRadius = 3;
    }
    return _vestButton;
}


@end
