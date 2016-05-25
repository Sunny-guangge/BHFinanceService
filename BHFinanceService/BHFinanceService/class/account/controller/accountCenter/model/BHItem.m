//
//  BHItem.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/25.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHItem.h"

@implementation BHItem

- (id)initWithTitle:(NSString *)title labelStr:(NSString *)labelStr ItemType:(BHItemType)itemType
{
    self = [super init];
    if (self) {
        
        _title = title;
        _labelStr = labelStr;
        _itemType = itemType;
        
    }
    return self;
}

- (id)initWithTitle:(NSString *)title headerURL:(NSString *)headerURL ItemType:(BHItemType)itemType
{
    self = [super init];
    if (self) {
        _title = title;
        _headerURL = headerURL;
        _itemType = itemType;
    }
    return self;
}

- (id)initWithTitle:(NSString *)buttonStr ItemType:(BHItemType)itemType
{
    self = [super init];
    if (self) {
        _buttonStr = buttonStr;
        _itemType = itemType;
    }
    return self;
}

- (id)initWithTitle:(NSString *)title placeHoleder:(NSString *)place text:(NSString *)text ItemType:(BHItemType)itemType
{
    self = [super init];
    if (self) {
        _title = title;
        _place = place;
        _text = text;
        _itemType = itemType;
    }
    return self;
}

@end
