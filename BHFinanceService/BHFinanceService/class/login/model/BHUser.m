//
//  BHUser.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHUser.h"
#import "BHAppAPIClient.h"
#import "BHConst.h"
#import "MJExtension.h"
#import "BHResopnse.h"

@implementation BHUser


+ (void)getuserLoginInfoWithSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    [[BHAppAPIClient sharedClient] POST:BHLoginInfo parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
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
