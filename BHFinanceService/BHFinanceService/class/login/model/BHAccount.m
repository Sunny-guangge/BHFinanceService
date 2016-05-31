//
//  BHAccount.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAccount.h"
#import "BHAppAPIClient.h"
#import "BHConst.h"
#import "MJExtension.h"
#import "BHResopnse.h"

@implementation BHAccount

+ (instancetype)accountWithDict:(NSDictionary *)dic
{
    BHAccount *account = [[self alloc] init];
    account.password = [dic objectForKey:@"password"];
    account.accountName = [dic objectForKey:@"accountName"];
    return account;
}

/**
 *  当一个对象要归档进沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.accountName forKey:@"accountName"];
}

/**
 *  当从沙盒中解档一个对象时（从沙盒中加载一个对象时），就会调用这个方法
 *  目的：在这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.accountName = [aDecoder decodeObjectForKey:@"accountName"];
        
    }
    return self;
}


+ (void)loginWithAccountName:(NSString *)account passWord:(NSString *)password responseSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:account forKey:@"username"];
    [dic setObject:password forKey:@"Password"];
    
    
    [[BHAppAPIClient sharedClient] POST:BHLoginURL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BHResopnse *response = [BHResopnse mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(response);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}

+ (void)verifyUserPhone:(NSString *)phone success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:phone forKey:@"mobile"];
    
    [[BHAppAPIClient sharedClient] POST:BHVerifyPhoneURL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BHResopnse *response = [BHResopnse mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(response);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}

+ (void)loginWithSMSWithPhone:(NSString *)phone SMSCode:(NSString *)code success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:phone forKey:@"mobile"];
    [dic setObject:code forKey:@"mcode"];
    
    [[BHAppAPIClient sharedClient] POST:BHLoginWithSMS parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BHResopnse *response = [BHResopnse mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(response);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)registerWithPhone:(NSString *)phone SMSCode:(NSString *)code password:(NSString *)password success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:phone forKey:@""];
    [dic setObject:code forKey:@""];
    [dic setObject:password forKey:@""];
    
    [[BHAppAPIClient sharedClient] POST:BHRegisterWithSMS parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BHResopnse *response = [BHResopnse mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(response);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)sendSMSCodeWithPhone:(NSString *)phone purpose:(NSString *)purpose accessPort:(NSString *)access success:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:phone forKey:@""];
    [dic setObject:purpose forKey:@""];
    [dic setObject:access forKey:@""];
    
    [[BHAppAPIClient sharedClient] POST:BHSendSMSCodeURL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BHResopnse *response = [BHResopnse mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(response);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)logoutSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    [[BHAppAPIClient sharedClient] POST:BHLogOut parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BHResopnse *response = [BHResopnse mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(response);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}

@end

