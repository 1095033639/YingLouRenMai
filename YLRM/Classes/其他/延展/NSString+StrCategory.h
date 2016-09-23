//
//  NSString+StrCategory.h
//  空港联盟
//
//  Created by TOMSZ on 15/8/21.
//  Copyright (c) 2015年 TOMSZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StrCategory)
// 定义一个延展，判断字符是否为中文
- (BOOL)isChinese;
// 判断子串串是否为手机号码
- (BOOL)isPhoneNum;
//  8-16位密码字符串。S{8,16}	   [a-z][A-Z][0-9]	   Abc123
- (BOOL)isRealPwd;
//  支付密码---6位纯数字
- (BOOL)isChenkNum;
@end
