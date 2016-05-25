//
//  NSString+BH.h
//  bankHuiClient
//
//  Created by 王帅广 on 16/3/17.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (BH)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;

-(NSString *) md5HexDigest;

+ (NSString *)makemd5:(NSString *)str;

/**
 *  是否空字符串
 *
 *  @return 如果字符串为nil或者长度为0返回YES
 */
- (BOOL)isEmptyString;

/**
 *  清空字符串中的空白字符
 *
 *  @return 清空空白字符串之后的字符串
 */
- (NSString *)trimString;

/**
 *  正则表达式，是否为手机号格式
 *
 *  @param str 手机号
 *
 *  @return BOOL
 */
+ (BOOL)checkTel:(NSString *)str;

/**
 *  判断是否为数字
 *
 *  @param NSString 输入的内容
 *
 *  @return 返回是否为数字的BOOL
 */
+ (BOOL)checkNum:(NSString *)str;

/**
 *  密码规则的正则表达式
 *
 *  @param NSString 要验证的密码
 *
 *  @return 返回是否符合规则
 */
+ (BOOL)checkPassWordIsCorrect:(NSString *)password;


#pragma mark - 数字转换成汉字
+(NSString *)translation:(NSString *)arebic;

@end
