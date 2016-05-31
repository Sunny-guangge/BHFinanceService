//
//  BHResopnse.h
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHResopnse : NSObject

/**
 *  返回的信息
 */
@property (nonatomic,copy) NSString *msg;

/**
 *  code
 */
@property (nonatomic,assign) NSInteger code;

/**
 *  obj 返回的具体信息
 */
@property (nonatomic,strong) id obj;

@end
