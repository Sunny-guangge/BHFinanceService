//
//  BHAccountCenterTableViewCell.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHCommonTableViewCell.h"

@protocol BHAccountCenterTableViewCellDelegate  <NSObject>

@optional
- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button;

- (void)accountCenterTextFieldDidEndEditing:(UITextField *)textField;

@end

@class BHItem;
@interface BHAccountCenterTableViewCell : BHCommonTableViewCell

@property (nonatomic,strong) BHItem *item;

@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) UIButton *codeButton;

@property (nonatomic,weak) id <BHAccountCenterTableViewCellDelegate>delegate;

@end
