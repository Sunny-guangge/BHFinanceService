//
//  BHAccountCenterTableViewCell.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAccountCenterTableViewCell.h"
#import "BHItem.h"
#import "UIView+BH.h"
#import "constant.h"

@interface BHAccountCenterTableViewCell ()<UITextFieldDelegate>

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UIImageView *hederImageView;

@property (nonatomic,strong) UIButton *button;

@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) UIButton *codeButton;

@end

//不同类型的cell的高度不一样    带有头像的是 80      button 是 50   label的是44

@implementation BHAccountCenterTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.hederImageView];
        [self addSubview:self.button];
        [self addSubview:self.textField];
        [self addSubview:self.codeButton];
        self.titleLabel.hidden = YES;
        self.detailLabel.hidden = YES;
        self.hederImageView.hidden = YES;
        self.button.hidden = YES;
        self.textField.hidden = YES;
        self.codeButton.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float spaceX = self.width * 0.05;
    float spaceY = self.height * 0.22;
    float height = self.height - spaceY * 2;
    
    if (_item.itemType == BHItemTypeUserHeader) {
        float maxW = self.width * 0.5;
        
        float lableWidth = [_titleLabel sizeThatFits:CGSizeMake(maxW, MAXFLOAT)].width;
        [_titleLabel setFrame:CGRectMake(spaceX, spaceY, lableWidth, height)];
        _hederImageView.frame = CGRectMake(self.width - 60 - 28, 10, 60, 60);
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (_item.itemType == BHItemTypeLabel) {
        
        float maxW = self.width * 0.5;
        
        float lableWidth = [_titleLabel sizeThatFits:CGSizeMake(maxW, MAXFLOAT)].width;
        [_titleLabel setFrame:CGRectMake(spaceX, spaceY, lableWidth, height)];
        
        [_detailLabel setFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 20, spaceY, self.width - 28 - 20 - CGRectGetMaxX(_titleLabel.frame), height)];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (_item.itemType == BHItemTypeButton) {
        
        [_button setFrame:CGRectMake(20, 10, self.width - 40, 40)];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.backgroundColor = [UIColor stringTOColor:BHAPPBackGroundColor];
    }
    
    if (_item.itemType == BHItemTypeTextField) {
        
        [_textField setFrame:CGRectMake(spaceX, 0, self.width - spaceX * 2, self.height)];
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (_item.itemType == BHItemTypeTextFieldGetCode) {
        
        [_textField setFrame:CGRectMake(spaceX, 0, self.width - spaceX * 2 - 80, self.height)];
        [_codeButton setFrame:CGRectMake(CGRectGetMaxX(_textField.frame), spaceY, 80, height)];
        self.accessoryType = UITableViewCellAccessoryNone;
        
    }
    if (_item.itemType == BHItemTypeLabelWithoutJianTou) {
        float maxW = self.width * 0.5;
        
        float lableWidth = [_titleLabel sizeThatFits:CGSizeMake(maxW, MAXFLOAT)].width;
        [_titleLabel setFrame:CGRectMake(spaceX, spaceY, lableWidth, height)];
        
        [_detailLabel setFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 20, spaceY, self.width - 28 - 20 - CGRectGetMaxX(_titleLabel.frame), height)];
        
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)setItem:(BHItem *)item
{
    _item = item;
    
    switch (item.itemType) {
        case BHItemTypeUserHeader:
            
            self.titleLabel.text = item.title;
            self.hederImageView.image = [UIImage imageNamed:item.headerURL];
            
            
            self.titleLabel.hidden = NO;
            self.hederImageView.hidden = NO;
            self.button.hidden = YES;
            self.detailLabel.hidden = YES;
            self.textField.hidden = YES;
            self.codeButton.hidden = YES;
            
            break;
        case BHItemTypeLabel:
            
            self.titleLabel.text = item.title;
            self.detailLabel.text = item.labelStr;
            
            self.titleLabel.hidden = NO;
            self.hederImageView.hidden = YES;
            self.button.hidden = YES;
            self.detailLabel.hidden = NO;
            self.textField.hidden = YES;
            self.codeButton.hidden = YES;
            
            break;
        case BHItemTypeButton:
            
            [self.button setTitle:item.buttonStr forState:UIControlStateNormal];
            
            self.titleLabel.hidden = YES;
            self.hederImageView.hidden = YES;
            self.button.hidden = NO;
            self.detailLabel.hidden = YES;
            self.textField.hidden = YES;
            self.codeButton.hidden = YES;
            
            break;
            
        case BHItemTypeTextField:
            
            self.textField.placeholder = item.place;
            self.textField.text = item.text;
            
            self.titleLabel.hidden = YES;
            self.hederImageView.hidden = YES;
            self.button.hidden = YES;
            self.detailLabel.hidden = YES;
            self.textField.hidden = NO;
            self.codeButton.hidden = YES;
            
            break;
            
        case BHItemTypeTextFieldGetCode:
            
            self.textField.placeholder = item.place;
            
            
            self.titleLabel.hidden = YES;
            self.hederImageView.hidden = YES;
            self.button.hidden = YES;
            self.detailLabel.hidden = YES;
            self.textField.hidden = NO;
            self.codeButton.hidden = NO;
            
            break;
        
        case BHItemTypeLabelWithoutJianTou:
            
            self.titleLabel.text = item.title;
            self.detailLabel.text = item.labelStr;
            
            self.titleLabel.hidden = NO;
            self.hederImageView.hidden = YES;
            self.button.hidden = YES;
            self.detailLabel.hidden = NO;
            self.textField.hidden = YES;
            self.codeButton.hidden = YES;
            
        default:
            break;
    }
    
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (_detailLabel == nil) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textAlignment = NSTextAlignmentRight;
    }
    return _detailLabel;
}

- (UIImageView *)hederImageView
{
    if (_hederImageView == nil) {
        _hederImageView = [[UIImageView alloc] init];
        _hederImageView.layer.masksToBounds = YES;
        _hederImageView.layer.cornerRadius = 30;
    }
    return _hederImageView;
}

- (UIButton *)button
{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(clickCellButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button setBackgroundColor:[UIColor grayColor]];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.layer.masksToBounds = YES;
        _button.layer.cornerRadius = 3;
    }
    return _button;
}

- (UITextField *)textField
{
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)codeButton
{
    if (_codeButton == nil) {
        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_codeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_codeButton addTarget:self action:@selector(didClickGetCodeButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeButton;
}

- (void)didClickGetCodeButton
{
    
}

- (void)clickCellButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(clickAccountCenterTableViewCellButtonWithButton:)])  {
        [self.delegate clickAccountCenterTableViewCellButtonWithButton:button];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

@end
