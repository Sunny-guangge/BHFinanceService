//
//  BHConst.h
//
//
//  Created by user on 16/5/13.
//  Copyright (c) 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BHServerAdd @"http://test.ifsf.bankhui.com"


#pragma mark - 登录&&注册
extern NSString *const BHLoginURL; //用户名、邮箱、手机号登陆

extern NSString *const BHLogOut; //退出登陆

extern NSString *const BHLoginInfo; //请求用户的基本信息

extern NSString *const BHVerifyPhoneURL; //验证手机号

extern NSString *const BHLoginWithSMS; //短信登陆

extern NSString *const BHRegisterWithSMS; //短信注册

extern NSString *const BHSendSMSCodeURL; //通知发送短信验证码