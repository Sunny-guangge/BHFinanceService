//
//  BHAccountTool.m
//  BHFinanceService
//
//  Created by 王帅广 on 16/5/30.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHAccountTool.h"
#import "constant.h"

@implementation BHAccountTool


+ (void)saveAccount:(BHAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:BHAccountPath];
}



+ (BHAccount *)account
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:BHAccountPath];
}

@end
