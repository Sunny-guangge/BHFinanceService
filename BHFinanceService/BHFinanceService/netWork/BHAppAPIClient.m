//
//  BHAppAPIClient.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAppAPIClient.h"
#import "BHConst.h"

//static NSString * const AFAppDotNetAPIBaseURLString = @"http://test.ifsf.bankhui.com";

static NSString * const AFAppDotNetAPIBaseURLString = @"http://10.10.11.109:8080/IFS-web";

@implementation BHAppAPIClient

+ (instancetype)sharedClient {
    static BHAppAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BHAppAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                                  @"text/html",
                                                                                  @"text/json",
                                                                                  @"text/plain",
                                                                                  @"text/javascript",
                                                                                  @"text/xml",
                                                                                  @"image/*"]];
    });
    
    return _sharedClient;
}

@end
