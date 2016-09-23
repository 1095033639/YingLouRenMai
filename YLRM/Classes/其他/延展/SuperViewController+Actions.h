//
//  SuperViewController+Actions.h
//  StudioHD
//
//  Created by Chan_Sir on 16/8/10.
//  Copyright © 2016年 陈振超. All rights reserved.
//

#import "SuperViewController.h"

@interface UIViewController (Actions)

/** 时间戳转化为东八区时间字符串 */
- (NSString *)TimeIntToDateStr:(NSTimeInterval)timeInterval;

- (void)showHudMessage:(NSString *)message;
- (void)hideHud:(NSInteger)seconds;

- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

/** 成功提示 */
- (void)showSuccessTips:(NSString *)tips;
/** 错误提示 */
- (void)showErrorTips:(NSString *)tips;
/** 警告 */
- (void)showWarningTips:(NSString *)tips;

/** 将字典或数组转化为JSON串 */
- (NSString *)toJsonStr:(id)object;
/** 将json串转成数组或字典 */
- (id)toArrayOrNSDictionary:(NSData *)jsonData;

#pragma mark -当前时间
- (NSString *)getCurrentTime;

@end
