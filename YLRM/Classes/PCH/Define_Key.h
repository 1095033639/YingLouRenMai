//
//  Define_Key.h
//  YLRM
//
//  Created by Chan_Sir on 16/9/1.
//  Copyright © 2016年 陈振超. All rights reserved.
//

#ifndef Define_Key_h
#define Define_Key_h

// 获取设备的bounds
#define SCREEN_BOUNDS   [UIScreen mainScreen].bounds
// 获取设备宽
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
// 高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// RGB
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// 蒙蒙的图层
#define CoverColor RGBACOLOR(79, 79, 100, 0.8)
// 随机颜色
#define HWRandomColor RGBACOLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),1)
// 子线程
#define ZCGlobalQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
// 主线程
#define ZCMainQueue dispatch_get_main_queue()
//  比例 4.7为标准
#define CKproportion SCREEN_WIDTH/375.f
// iOS系统版本
#define iOS_Version [[[UIDevice currentDevice] systemVersion] doubleValue]

// 导航控制器的颜色
#define NavColor RGBACOLOR(45,44,63,1)
// 背景颜色
#define BackGroundColor RGBACOLOR(232,235,238,1)
// 按钮颜色
#define MainColor RGBACOLOR(43, 173, 63, 1)


/****************漂亮颜色珍藏******************/
#define duowanColor RGBACOLOR(33, 42, 68, 1)
#define wechatColor RGBACOLOR(93, 224, 51, 1) // 微信颜色
#define redddColor RGBACOLOR(183, 28, 43, 1)  // 偏向棕红色

#endif
