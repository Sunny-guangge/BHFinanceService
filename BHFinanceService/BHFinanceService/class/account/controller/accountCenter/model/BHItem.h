//
//  BHItem.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,BHItemType) {
    BHItemTypeUserHeader,
    BHItemTypeLabel,
    BHItemTypeButton,
    BHItemTypeBackWhiteButton,
    BHItemTypeTextField,
    BHItemTypeTextFieldGetCode,
    BHItemTypeLabelWithoutJianTou,
};

@interface BHItem : NSObject

@property (nonatomic,assign) BHItemType itemType;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *headerURL;

@property (nonatomic,strong) NSString *labelStr;

@property (nonatomic,strong) NSString *buttonStr;

@property (nonatomic,strong) NSString *place;

@property (nonatomic,strong) NSString *text;

- (id)initWithTitle:(NSString *)title labelStr:(NSString *)labelStr ItemType:(BHItemType)itemType; //label

- (id)initWithTitle:(NSString *)title headerURL:(NSString *)headerURL ItemType:(BHItemType)itemType;//带头像的

- (id)initWithTitle:(NSString *)buttonStr ItemType:(BHItemType)itemType; //只有一个button的

- (id)initWithTitle:(NSString *)title placeHoleder:(NSString *)place text:(NSString *)text ItemType:(BHItemType)itemType; //textview

@end
