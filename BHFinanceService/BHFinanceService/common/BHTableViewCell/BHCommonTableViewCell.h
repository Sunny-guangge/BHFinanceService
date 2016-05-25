//
//  BHCommonTableViewCell.h
//  bankHuiClient
//
//  Created by 王帅广 on 16/3/23.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BHCellLineStyle) {
    BHCellLineStyleDefault,
    BHCellLineStyleFill,
    BHCellLineStyleNone,
};

@interface BHCommonTableViewCell : UITableViewCell



/**
 *线距离左边的距离
 */
@property (nonatomic,assign) CGFloat leftfreespace;

/**
 *顶部线的格式
 */
@property (nonatomic,assign) BHCellLineStyle topLineStyle;

/**
 *底部线的格式
 */
@property (nonatomic,assign) BHCellLineStyle bottomLineStyle;

@end
