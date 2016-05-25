//
//  AppConstant.m
//  bankHui
//
//  Created by 王帅广 on 16/3/9.
//  Copyright © 2016年 王帅广. All rights reserved.
//  APP的一些宏定义

#pragma mark - APP的一些宏定义

#define SCREENH [[UIScreen mainScreen] bounds].size.height
#define SCREEHW  [[UIScreen mainScreen] bounds].size.width


#pragma mark Nav and TabBar

#define BHUINavigationBarFrameH         44.0f
#define BHUITabBarFrameH                49.0f

#define BHStatusBarH                    20.0f

//#define     DEFAULT_BACKGROUND_COLOR        
#define     BHAPPMAINCOLOR @"#e93031"
#define     BHAPPBackGroundColor @"#f6f5f1"

// 账号的存储路径
#define BHAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]



//用户的信息存储路径
#define BHUserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.archive"] //用户信息
#define BHLoanPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"loan.archive"]  //贷款信息
#define BHProductPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"product.plist"]  //产品信息

//保存图片到本地
#define BHSaveImagePath(str) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:str]

//16进制颜色转换
#define BHColorWithSix(sixteen) [UIColor stringTOColor:sixteen]


//用户的消息页的字体的大小
#define BHInformationTitleFont 14
#define BHInformationTimeFont 12

#define BHLeft 10
#define BHTop 5


