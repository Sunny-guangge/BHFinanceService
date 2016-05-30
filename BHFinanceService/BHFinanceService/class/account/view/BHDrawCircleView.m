//
//  BHDrawCircleView.m
//  BHDrawCircle
//
//  Created by 王帅广 on 16/5/27.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHDrawCircleView.h"

@interface BHDrawCircleView ()

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *circleView;

@end

@implementation BHDrawCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.circleView];
        
        [self initUI];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(10, 5, self.bounds.size.width, 20);
    
    _circleView.frame = CGRectMake(0, CGRectGetMaxY(_titleLabel.bounds)+10, 200, 200);
    
    
}

- (void)initUI
{
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:80 startAngle:1.005*M_PI endAngle:1.6*M_PI clockwise:YES];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:80 startAngle:1.605*M_PI endAngle:0.2*M_PI clockwise:YES];
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:80 startAngle:0.205*M_PI endAngle:0.6*M_PI clockwise:YES];
    UIBezierPath *path4 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:80 startAngle:0.605*M_PI endAngle:1*M_PI clockwise:YES];
    
    NSLog(@"%f",_circleView.bounds.size.width / 2);
    
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.path = path1.CGPath;
    layer1.lineWidth = 20;
    layer1.fillColor = [UIColor whiteColor].CGColor;
    layer1.strokeColor = [UIColor redColor].CGColor;
    layer1.frame=_circleView.bounds;
    [_circleView.layer addSublayer:layer1];
    
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.path = path2.CGPath;
    layer2.lineWidth = 20;
    layer2.fillColor = [UIColor whiteColor].CGColor;
    layer2.strokeColor = [UIColor blueColor].CGColor;
    layer2.frame=_circleView.bounds;
    [_circleView.layer addSublayer:layer2];
    
    CAShapeLayer *layer3 = [CAShapeLayer layer];
    layer3.path = path3.CGPath;
    layer3.lineWidth = 20;
    layer3.fillColor = [UIColor whiteColor].CGColor;
    layer3.strokeColor = [UIColor greenColor].CGColor;
    layer3.frame=_circleView.bounds;
    [_circleView.layer addSublayer:layer3];
    
    CAShapeLayer *layer4 = [CAShapeLayer layer];
    layer4.path = path4.CGPath;
    layer4.lineWidth = 20;
    layer4.fillColor = [UIColor whiteColor].CGColor;
    layer4.strokeColor = [UIColor blackColor].CGColor;
    layer4.frame=_circleView.bounds;
    [_circleView.layer addSublayer:layer4];
    
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"资产分析";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return _titleLabel;
}

- (UIView *)circleView
{
    if (_circleView == nil) {
        _circleView = [[UIView alloc] init];
        _circleView.backgroundColor = [UIColor whiteColor];
        
    }
    return _circleView;
}

@end
