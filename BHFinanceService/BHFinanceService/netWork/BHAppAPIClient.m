//
//  BHAppAPIClient.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAppAPIClient.h"
#import "BHConst.h"

static NSString * const AFAppDotNetAPIBaseURLString = @"http://test.ifsf.bankhui.com";

@implementation BHAppAPIClient

+ (instancetype)sharedClient {
    static BHAppAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BHAppAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
