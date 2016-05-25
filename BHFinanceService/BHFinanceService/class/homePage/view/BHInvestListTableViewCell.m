//
//  BHInvestListTableViewCell.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/24.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHInvestListTableViewCell.h"
#import "BHTender.h"
#import "constant.h"

@interface BHInvestListTableViewCell ()

@property (nonatomic,strong) UIView *containView;

@property (nonatomic,strong) UIImageView *vestTypeImageView;
@property (nonatomic,strong) UILabel *vestTitleLabel;

//年化利率
@property (nonatomic,strong) UIView *aprBackView;
@property (nonatomic,strong) UILabel *aprLabel;
@property (nonatomic,strong) UILabel *aprTitleLabel;

//项目期限
@property (nonatomic,strong) UIView *monthBackView;
@property (nonatomic,strong) UILabel *monthLabel;
@property (nonatomic,strong) UILabel *monthTitleLabel;

//可投金额
@property (nonatomic,strong) UIView *sumBackView;
@property (nonatomic,strong) UILabel *sumLabel;
@property (nonatomic,strong) UILabel *sumTitleLabel;

//立即投资  和  还款中
@property (nonatomic,strong) UIView *buttonBackView;
@property (nonatomic,strong) UIButton *investButton;
@property (nonatomic,strong) UIView *repayView;
@property (nonatomic,strong) UILabel *repayLabel;
@end

//定义一些常亮
static const CGFloat cellH = 120.0f; //cell的高度
static const CGFloat vestTitleFont = 14;// 投资标题的字体大小
static const CGFloat cutiFont = 20; //所有粗体显示的字体的大小
static const CGFloat huiseFont = 12; //灰色字体的大小

static const CGFloat distanceCell = 10; //空白的高度
static const CGFloat distanceLeftRight = 10; //距离左右边框的距离都为5

static const CGFloat vestImageWH = 20;

@implementation BHInvestListTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self addSubview:self.containView];
        [self.containView addSubview:self.vestTypeImageView];
        [self.containView addSubview:self.vestTitleLabel];
        
        [self.containView addSubview:self.aprBackView];
        [self.aprBackView addSubview:self.aprLabel];
        [self.aprBackView addSubview:self.aprTitleLabel];
        
        [self.containView addSubview:self.monthBackView];
        [self.monthBackView addSubview:self.monthLabel];
        [self.monthBackView addSubview:self.monthTitleLabel];
        
        [self.containView addSubview:self.sumBackView];
        [self.sumBackView addSubview:self.sumLabel];
        [self.sumBackView addSubview:self.sumTitleLabel];
        
        [self.containView addSubview:self.buttonBackView];
//        [self.buttonBackView addSubview:self.investButton];
        [self.buttonBackView addSubview:self.repayView];
        [self.buttonBackView addSubview:self.repayLabel];
//        self.repayView.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _containView.frame = CGRectMake(0, distanceCell, SCREEHW, cellH - distanceCell);
    
    _vestTypeImageView.frame = CGRectMake(distanceLeftRight, distanceLeftRight, vestImageWH, vestImageWH);
    
    _vestTitleLabel.frame = CGRectMake(CGRectGetMaxX(_vestTypeImageView.frame) + distanceLeftRight, distanceLeftRight, SCREEHW - distanceLeftRight - CGRectGetMaxX(_vestTypeImageView.frame) - distanceLeftRight, 20);
    
    CGFloat w = (SCREEHW - 2 * distanceLeftRight) / 4;
    _aprBackView.frame = CGRectMake(distanceLeftRight, CGRectGetMaxY(_vestTypeImageView.frame) + distanceLeftRight, w, 70);
    _aprLabel.frame = CGRectMake(0, distanceLeftRight, w, 20);
    _aprTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(_aprLabel.frame) + distanceLeftRight, w, 15);
    
    
    _monthBackView.frame = CGRectMake(CGRectGetMaxX(_aprBackView.frame), CGRectGetMaxY(_vestTypeImageView.frame) + distanceLeftRight, w, 70);
    _monthLabel.frame = CGRectMake(0, distanceLeftRight, w, 20);
    _monthTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(_monthLabel.frame) + distanceLeftRight, w, 15);
    
    
    _sumBackView.frame = CGRectMake(CGRectGetMaxX(_monthBackView.frame), CGRectGetMaxY(_vestTypeImageView.frame) + distanceLeftRight, w, 70);
    _sumLabel.frame = CGRectMake(0, distanceLeftRight, w, 20);
    _sumTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(_sumLabel.frame) + distanceLeftRight, w, 15);
    
    _buttonBackView.frame = CGRectMake(CGRectGetMaxX(_sumBackView.frame), CGRectGetMaxY(_vestTypeImageView.frame), w, 70 + distanceLeftRight);
    _investButton.frame = CGRectMake(5, distanceLeftRight, w - 8, 30);
    _repayView.frame = CGRectMake(10, distanceLeftRight, 60, 60);
    _repayLabel.frame = CGRectMake(10, distanceLeftRight, 60, 60);
    
}

- (void)setTender:(BHTender *)tender
{
    _tender = tender;
    
    
    
}


#pragma mark - Getter & Setter
- (UIView *)containView
{
    if (_containView == nil) {
        
        _containView = [[UIView alloc] init];
        _containView.backgroundColor = [UIColor whiteColor];
    }
    return _containView;
}

- (UIImageView *)vestTypeImageView
{
    if (_vestTypeImageView == nil) {
        _vestTypeImageView = [[UIImageView alloc] init];
        _vestTypeImageView.backgroundColor = [UIColor redColor];
        _vestTypeImageView.layer.masksToBounds = YES;
        _vestTypeImageView.layer.cornerRadius = 5;
    }
    return _vestTypeImageView;
}

- (UILabel *)vestTitleLabel
{
    if (_vestTitleLabel == nil) {
        _vestTitleLabel = [[UILabel alloc] init];
        _vestTitleLabel.font = [UIFont boldSystemFontOfSize:vestTitleFont];
        _vestTitleLabel.numberOfLines = 0;
        _vestTitleLabel.textColor = [UIColor redColor];
        _vestTitleLabel.text = @"银行类金融机构债权0000";
    }
    return _vestTitleLabel;
}

//年化利率
- (UIView *)aprBackView
{
    if (_aprBackView == nil) {
        _aprBackView = [[UIView alloc] init];
        _aprBackView.backgroundColor = [UIColor whiteColor];
    }
    return _aprBackView;
}

- (UILabel *)aprLabel
{
    if (_aprLabel == nil) {
        _aprLabel = [[UILabel alloc] init];
        _aprLabel.font = [UIFont boldSystemFontOfSize:huiseFont];
        _aprLabel.textAlignment = NSTextAlignmentCenter;
        _aprLabel.textColor = [UIColor redColor];
        
        NSString * aString = @"15 %";
        
        //富文本对象
        NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:aString];
        
        //富文本样式
        [aAttributedString addAttribute:NSForegroundColorAttributeName  //文字颜色
                                  value:[UIColor redColor]
                                  range:NSMakeRange(0, aAttributedString.length - 1)];
        
        [aAttributedString addAttribute:NSFontAttributeName             //文字字体
                                  value:[UIFont systemFontOfSize:cutiFont]
                                  range:NSMakeRange(0, aAttributedString.length - 1)];
        
        _aprLabel.attributedText = aAttributedString;
    }
    return _aprLabel;
}


- (UILabel *)aprTitleLabel
{
    if (_aprTitleLabel == nil) {
        _aprTitleLabel = [[UILabel alloc] init];
        _aprTitleLabel.font = [UIFont systemFontOfSize:huiseFont];
        _aprTitleLabel.text = @"年化利率";
        _aprTitleLabel.textAlignment = NSTextAlignmentCenter;
        _aprTitleLabel.textColor = [UIColor grayColor];
    }
    return _aprTitleLabel;
}

//项目期限
- (UIView *)monthBackView
{
    if (_monthBackView == nil) {
        _monthBackView = [[UIView alloc] init];
        _monthBackView.backgroundColor = [UIColor whiteColor];
    }
    return _monthBackView;
}

- (UILabel *)monthLabel
{
    if (_monthLabel == nil) {
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.font = [UIFont boldSystemFontOfSize:huiseFont];
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        _monthLabel.textColor = [UIColor grayColor];
        
        NSString * aString = @"0.5 个月";
        
        //富文本对象
        NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:aString];
        
        //富文本样式
        [aAttributedString addAttribute:NSForegroundColorAttributeName  //文字颜色
                                  value:[UIColor blackColor]
                                  range:NSMakeRange(0, aAttributedString.length - 2)];
        
        [aAttributedString addAttribute:NSFontAttributeName             //文字字体
                                  value:[UIFont systemFontOfSize:cutiFont]
                                  range:NSMakeRange(0, aAttributedString.length - 2)];
        
        _monthLabel.attributedText = aAttributedString;
    }
    return _monthLabel;
}


- (UILabel *)monthTitleLabel
{
    if (_monthTitleLabel == nil) {
        _monthTitleLabel = [[UILabel alloc] init];
        _monthTitleLabel.font = [UIFont systemFontOfSize:huiseFont];
        _monthTitleLabel.text = @"项目期限";
        _monthTitleLabel.textAlignment = NSTextAlignmentCenter;
        _monthTitleLabel.textColor = [UIColor grayColor];
    }
    return _monthTitleLabel;
}

//可投金额
- (UIView *)sumBackView
{
    if (_sumBackView == nil) {
        _sumBackView = [[UIView alloc] init];
        _sumBackView.backgroundColor = [UIColor whiteColor];
    }
    return _sumBackView;
}

- (UILabel *)sumLabel
{
    if (_sumLabel == nil) {
        _sumLabel = [[UILabel alloc] init];
        _sumLabel.font = [UIFont boldSystemFontOfSize:huiseFont];
        _sumLabel.textAlignment = NSTextAlignmentCenter;
        _sumLabel.textColor = [UIColor grayColor];
        
        NSString * aString = @"99 万";
        
        //富文本对象
        NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:aString];
        
        //富文本样式
        [aAttributedString addAttribute:NSForegroundColorAttributeName  //文字颜色
                                  value:[UIColor blackColor]
                                  range:NSMakeRange(0, aAttributedString.length - 1)];
        
        [aAttributedString addAttribute:NSFontAttributeName             //文字字体
                                  value:[UIFont systemFontOfSize:cutiFont]
                                  range:NSMakeRange(0, aAttributedString.length - 1)];
        
        _sumLabel.attributedText = aAttributedString;
    }
    return _sumLabel;
}


- (UILabel *)sumTitleLabel
{
    if (_sumTitleLabel == nil) {
        _sumTitleLabel = [[UILabel alloc] init];
        _sumTitleLabel.font = [UIFont systemFontOfSize:huiseFont];
        _sumTitleLabel.text = @"可投金额";
        _sumTitleLabel.textAlignment = NSTextAlignmentCenter;
        _sumTitleLabel.textColor = [UIColor grayColor];
    }
    return _sumTitleLabel;
}

//立即投资  和  还款中
- (UIView *)buttonBackView
{
    if (_buttonBackView == nil) {
        _buttonBackView = [[UIView alloc] init];
        _buttonBackView.backgroundColor = [UIColor whiteColor];
    }
    return _buttonBackView;
}

- (UIButton *)investButton
{
    if (_investButton == nil) {
        
        _investButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_investButton setTitle:@"立即投资" forState:UIControlStateNormal];
        _investButton.layer.cornerRadius = 3;
        _investButton.layer.masksToBounds = YES;
        _investButton.layer.borderWidth = 1;
        _investButton.layer.borderColor = [UIColor blueColor].CGColor;
        [_investButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _investButton;
}

- (UIView *)repayView
{
    if (_repayView == nil) {
        
        _repayView = [[UIView alloc] init];
        _repayView.layer.masksToBounds = YES;
        _repayView.layer.borderWidth = 1;
        _repayView.layer.borderColor = [UIColor grayColor].CGColor;
        _repayView.layer.cornerRadius = 30;
        
    }
    return _repayView;
}

- (UILabel *)repayLabel
{
    if (_repayLabel == nil) {
        _repayLabel = [[UILabel alloc] init];
        _repayLabel.font = [UIFont systemFontOfSize:huiseFont];
        _repayLabel.textColor = [UIColor grayColor];
        _repayLabel.textAlignment = NSTextAlignmentCenter;
        _repayLabel.text = @"还款中";
    }
    return _repayLabel;
}


@end
