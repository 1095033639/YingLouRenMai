//
//  UIBarButtonItem+Extension.m
//  空港联盟
//
//  Created by TOMSZ on 15/8/25.
//  Copyright (c) 2015年 TOMSZ. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

#pragma mark - 自定义一个navgationbar
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateNormal];
    // 设置尺寸----宽高
    btn.bounds = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.height);
    
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
