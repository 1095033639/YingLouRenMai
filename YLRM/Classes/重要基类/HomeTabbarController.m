//
//  HomeTabbarController.m
//  FYQ
//
//  Created by Chan_Sir on 16/8/1.
//  Copyright © 2016年 陈振超. All rights reserved.
//

#import "HomeTabbarController.h"
#import "HomeNavigationController.h"
#import "TestViewController.h"
#import <SVProgressHUD.h>
#import "FYQTabbar.h"
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"


@interface HomeTabbarController ()<FYQTabbarDelegate,UITabBarDelegate,UIViewControllerTransitioningDelegate>


/** tabbar中的那层有色bar */
@property (strong,nonatomic) UIView *barView;
/** button */
@property (strong,nonatomic) UIButton *button;

@end

@implementation HomeTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HWRandomColor;
    
    TestViewController *mainVC = [[TestViewController alloc]init];
    mainVC.tabBarItem.tag = 1;
    [self addChildVC:mainVC Title:@"直播" image:@"puti_normal" selectedImage:@"puti_highted"];
    
    TestViewController *zenVC = [[TestViewController alloc]init];
    zenVC.tabBarItem.tag = 2;
    [self addChildVC:zenVC Title:@"消息" image:@"puti_normal" selectedImage:@"puti_highted"];
    
    TestViewController *discoverVC = [[TestViewController alloc]init];
    discoverVC.tabBarItem.tag = 3;
    [self addChildVC:discoverVC Title:@"探索" image:@"puti_normal" selectedImage:@"puti_highted"];
    
    TestViewController *userVC = [[TestViewController alloc]init];
    userVC.tabBarItem.tag = 4;
    [self addChildVC:userVC Title:@"我" image:@"puti_normal" selectedImage:@"puti_highted"];
    
    FYQTabbar *cusTabbar = [[FYQTabbar alloc]init];
    cusTabbar.sendDelegate = self;
    [self setValue:cusTabbar forKeyPath:@"tabBar"];
    
    
}

#pragma mark - 添加子控制器
- (void)addChildVC:(UIViewController *)childVC Title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    
    //    childVC.tabBarItem.imag
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttres = [NSMutableDictionary dictionary];
    textAttres[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    textAttres[NSForegroundColorAttributeName] = RGBACOLOR(191, 191, 191, 1);
    
    NSMutableDictionary *selectTextAttres = [NSMutableDictionary dictionary];
    selectTextAttres[NSForegroundColorAttributeName] = RGBACOLOR(38, 203, 114, 1);
    selectTextAttres[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    [childVC.tabBarItem setTitleTextAttributes:textAttres forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectTextAttres forState:UIControlStateSelected];
    HomeNavigationController *normalNav = [[HomeNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:normalNav];
    
    
}
#pragma mark - POP动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [PresentingAnimator new];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissingAnimator new];
}
- (void)tabbarDidClickSendBtn:(FYQTabbar *)tabbar
{
    TestViewController *sendMsg = [TestViewController new];
    sendMsg.transitioningDelegate = self;
    sendMsg.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:sendMsg animated:YES completion:^{
        
    }];
}



@end
