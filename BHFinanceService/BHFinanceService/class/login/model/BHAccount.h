//
//  BHAccount.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHResopnse.h"

@interface BHAccount : NSObject

@property (nonatomic,copy) NSString *accountName;

@property (nonatomic,copy) NSString *password;

+ (void)loginWithAccountName:(NSString *)account passWord:(NSString *)password responseSuccess:(void(^)(BHResopnse *response))success failure:(void(^)(NSError *error))failure;

@end
