//
//  FYQTabbar.h
//  佛友圈
//
//  Created by Chan_Sir on 16/4/13.
//  Copyright © 2016年 陈振超. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FYQTabbar;

@protocol FYQTabbarDelegate <UITabBarDelegate>

- (void)tabbarDidClickSendBtn:(FYQTabbar *)tabbar;

@end

@interface FYQTabbar : UITabBar

@property (weak,nonatomic) id<FYQTabbarDelegate> sendDelegate;

@end
