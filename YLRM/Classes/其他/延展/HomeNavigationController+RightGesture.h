//
//  HomeNavigationController+RightGesture.h
//  佛友圈
//
//  Created by Chan_Sir on 16/4/1.
//  Copyright © 2016年 陈振超. All rights reserved.<https://github.com/forkingdog>
//

#import <UIKit/UIKit.h>
#import "HomeNavigationController.h"

@interface HomeNavigationController (RightGesture)

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *fd_fullscreenPopGestureRecognizer;
@property (nonatomic, assign) BOOL fd_viewControllerBasedNavigationBarAppearanceEnabled;

@end


@interface UIViewController (RightGesture)

/** 决定某个控制器左滑返回是否失效 */
@property (nonatomic, assign) BOOL fd_interactivePopDisabled;
/** 实现透明导航栏,有BUG */
@property (nonatomic, assign) BOOL fd_prefersNavigationBarHidden;
/** 右滑最大尺度 */
@property (nonatomic, assign) CGFloat fd_interactivePopMaxAllowedInitialDistanceToLeftEdge;


@end
