//
//  BHTender.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/24.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

//借款类型
typedef NS_ENUM(NSInteger , BHborrowType) {
    BHborrowTypeCar = 0,//骑车金融
    BHborrowTypeHouse = 1, //房产金融
    BHborrowTypeEnsure = 2, //担保项目
    BHborrowTypeMortgage = 3, //抵押贷
    BHborrowTypeConsume = 4 , //消费贷
};

//项目状态
typedef NS_ENUM(NSInteger,BHBorrowStatus) {
    BHBorrowStatusAdvance = 1, // 预上线
    BHBorrowStatusUnderWay = 2, // 进行中
    BHBorrowStatusDone = 3, //已完成
};

@interface BHTender : NSObject

/**
 *  年利率
 */
@property (nonatomic,strong) NSNumber *apr;

/**
 *  借款类型
 */
@property (nonatomic,assign) BHborrowType borrowtype;

/**
 *  筹标到期时间距现在天数
 */
@property (nonatomic,strong) NSNumber *daysToNow;

/**
 *  标的id
 */
@property (nonatomic,strong) NSNumber *id;

/**
 *  投资类型
 */
//@property (nonatomic,strong) 

/**
 *  是否是新手
 */
@property (nonatomic,assign) BOOL isNew;

/**
 *  是否是推荐标
 */
@property (nonatomic,assign) BOOL isRecommend;

/**
 *  no
 */
@property (nonatomic,strong) NSNumber *no;

/**
 *  借款期限
 */
@property (nonatomic,strong) NSNumber *periods;

/**
 *  筹标到期时间
 */
@property (nonatomic,strong) NSNumber *raiseEndTime;

/**
 *  剩余金额
 */
@property (nonatomic,strong) NSNumber *remainAmount;

/**
 *  奖励利率
 */
@property (nonatomic,strong) NSNumber *rewardRate;

/**
 *  title
 */
@property (nonatomic,strong) NSString *title;

/**
 *  项目状态
 */
@property (nonatomic,assign) BHBorrowStatus borrowStatus;

@end
