//
//  BHAccountHeaderView.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BHAccountHeaderViewDelegate <NSObject>

- (void)clickUserHeader;

@end

@interface BHAccountHeaderView : UIView

@property (nonatomic,weak) id<BHAccountHeaderViewDelegate> delegate;

@end
