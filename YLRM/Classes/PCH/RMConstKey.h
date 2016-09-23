//
//  RMConstKey.h
//  YLRM
//
//  Created by Chan_Sir on 16/9/1.
//  Copyright © 2016年 陈振超. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/************  通知及监听 关键字  *****************/
#define YLNotificationCenter [NSNotificationCenter defaultCenter]

/** 清理缓存后通知已加载的界面刷新数据 */
extern NSString *const YLClearReloadData;


/********* NSUserDefault 关键字 **********/
extern NSString *const isFirstComeIn; // 第一次进来展示引导指标
extern NSString *const CFBundleVersion; // 版本号
extern NSString *const HowToUse; // 怎么使用



/************** 其他键值 *************/

extern const CGFloat kDockItemH; // Dock的高
/** 弹出vc-减去宽度*/
extern CGFloat const FatieAnimationWidthMinus;
/** 弹出vc-减去高度*/
extern CGFloat const FatieAnimationHeightMinus;




NS_ASSUME_NONNULL_END