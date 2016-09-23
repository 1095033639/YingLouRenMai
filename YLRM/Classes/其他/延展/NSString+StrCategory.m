 //
//  NSString+StrCategory.m
//  空港联盟
//
//  Created by TOMSZ on 15/8/21.
//  Copyright (c) 2015年 TOMSZ. All rights reserved.
//

#import "NSString+StrCategory.h"

@implementation NSString (StrCategory)
- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@",match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isPhoneNum
{
    NSString *match = @"(^[1][3578][0-9]{9}$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@",match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isRealPwd
{
    NSString *match = @"([a-zA-z]\\w{5,13})";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@",match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isChenkNum
{
    NSString *match = @"([0-9]{6})";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@",match];
    return [predicate evaluateWithObject:self];
}

@end
