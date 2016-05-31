//
//  BHAccount.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BHResopnse;
@interface BHAccount : NSObject<NSCoding>

@property (nonatomic,copy) NSString *accountName;

@property (nonatomic,copy) NSString *password;

+ (instancetype)accountWithDict:(NSDictionary *)dic;

/**
 *  登陆的接口
 *
 *  @param account  账户的账户名称：手机号、用户名、邮箱
 *  @param password 账号的密码
 *  @param success  登陆成功的回调
 *  @param failure  链接失败的回调
 */
+ (void)loginWithAccountName:(NSString *)account passWord:(NSString *)password responseSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;

/**
 *  验证用户的手机号
 *
 *  @param phone   手机号
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
+ (void)verifyUserPhone:(NSString *)phone success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;

/**
 *  短信登陆
 *
 *  @param phone   手机号
 *  @param code    短信验证码
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
+ (void)loginWithSMSWithPhone:(NSString *)phone SMSCode:(NSString *)code success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;

/**
 *  短信注册
 *
 *  @param phone    手机号
 *  @param code     手机验证码
 *  @param password 登陆密码
 *  @param success  成功的回调
 *  @param failure  失败的回调
 */
+ (void)registerWithPhone:(NSString *)phone SMSCode:(NSString *)code password:(NSString *)password success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;

/**
 *  发送手机验证码
 *
 *  @param phone   手机号
 *  @param purpose 功能参数 注册的时候是8 登陆的时候是27
 *  @param access  客户端  iOS 3
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
+ (void)sendSMSCodeWithPhone:(NSString *)phone purpose:(NSString *)purpose accessPort:(NSString *)access success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;

/**
 *  退出登陆
 *
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
+ (void)logoutSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;


@end
