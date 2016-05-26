//
//  BHAccountCenterTableViewCell.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHCommonTableViewCell.h"

@protocol BHAccountCenterTableViewCellDelegate  <NSObject>

- (void)clickAccountCenterTableViewCellButtonWithButton:(UIButton *)button;

@end

@class BHItem;
@interface BHAccountCenterTableViewCell : BHCommonTableViewCell

@property (nonatomic,strong) BHItem *item;

@property (nonatomic,weak) id <BHAccountCenterTableViewCellDelegate>delegate;

@end
