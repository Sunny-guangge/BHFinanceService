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

@implementation BHAccount

+ (void)loginWithAccountName:(NSString *)account passWord:(NSString *)password responseSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:account forKey:@"username"];
    [dic setObject:password forKey:@"Password"];
    
    
    [[BHAppAPIClient sharedClient] POST:BHLoginURL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
}

@end
