//
//  HomeNavigationController.m
//  空港联盟
//
//  Created by TOMSZ on 15/8/25.
//  Copyright (c) 2015年 TOMSZ. All rights reserved.
//

#import "HomeNavigationController.h"
#import "UIBarButtonItem+Extension.h"




@interface HomeNavigationController ()

@end

@implementation HomeNavigationController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"首页";
    self.navigationBar.translucent = NO; // 清除默认的半透明颜色
    
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    self.navigationBar.barTintColor = NavColor;
    self.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.hidesBarsWhenVerticallyCompact = YES;
    
}
#pragma mark - 导航背景颜色改变
- (void)BackColorChanged:(NSNotification *)noti
{
    UIColor *color = noti.object;
    self.navigationBar.barTintColor = color;
}
+ (void)initialize
{
    
    // 设置整个项目所有的item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置普通状态
    // key:NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    disableTextAttrs[NSFontAttributeName] = textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    
    
}

#pragma mark - 重写PUSH方法。拦截所有PUSH进来的控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {    // 非根控制器
        viewController.hidesBottomBarWhenPushed = YES;
        
        //  设置导航栏上面的内容
        //  设置左边的内容 navigationbar_back  navigationbar_back_highlighted
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(backClick) image:@"back" highImage:@"back"];
        //  右边的暂时不设置
         viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"barbuttonicon_more" highImage:@"barbuttonicon_more"];
      }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - back
- (void)backClick
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    
}


@end
