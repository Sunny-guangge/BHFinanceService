//
//  BHUser.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BHResopnse;
@interface BHUser : NSObject

/**
 *  手机号
 */
@property (nonatomic,copy) NSString *_mobile;

/**
 *  交易密码是否设置 0 未设置  1 设置
 */
@property (nonatomic,copy) NSNumber *_tradePwdStatus;

/**
 *  是否实名认证 0未认证 1认证
 */
@property (nonatomic,copy) NSNumber *_idCardStatus;

/**
 *  手机绑定状态 1绑定
 */
@property (nonatomic,copy) NSNumber *_mobileStatus;

/**
 *  用户名
 */
@property (nonatomic,copy) NSString *_userName;

/**
 *  loginFlag
 */
@property (nonatomic,copy) NSNumber *loginFlag;

/**
 *  sLastAccessTime
 */
@property (nonatomic,copy) NSNumber *sLastAccessTime;

/**
 *  sTimeout
 */
@property (nonatomic,copy) NSNumber *sTimeout;

+ (void)getuserLoginInfoWithSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;

@end
