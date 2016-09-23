//
//  NewFetherViewController.m
//  YLRM
//
//  Created by Chan_Sir on 16/9/1.
//  Copyright © 2016年 陈振超. All rights reserved.
//

#import "NewFetherViewController.h"
#import "SDCycleScrollView.h"
#import "HomeTabbarController.h"
#import <Masonry.h>


@interface NewFetherViewController ()


@end

@implementation NewFetherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"http://old.jfdaily.com/gb/jfxww/xj/node25212/images/00094604.jpg",@"http://www.granary.tw/shop/images/upload/Image/DOC/food%20list/vegetable%20foods/bean/bean-1-net.jpg",@"http://tianjin.sinaimg.cn/2015/0204/U11407P1334DT20150204152004.jpg"];
    [self setupSubViews:array];
}
- (void)setupSubViews:(NSArray *)images
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in images) {
        NSURL *url = [NSURL URLWithString:str];
        [array addObject:url];
    }
    
    // 创建不带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.view.bounds imageURLsGroup:array];
    cycleScrollView.backgroundColor = BackGroundColor;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    [self.view addSubview:cycleScrollView];
    
    
    // 立即体验
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    [button setTitleColor:wechatColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = WeChatColor;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = wechatColor.CGColor;
    button.layer.borderWidth = 1.f;
    button.layer.cornerRadius = 8;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-44);
        make.height.equalTo(@38);
        make.left.equalTo(self.view.mas_left).offset(80*CKproportion);
    }];
}
- (void)buttonClick
{
    
    HomeTabbarController *tabbar = [[HomeTabbarController alloc]init];
    // 3.当前版本号
    NSString *currentersion = [NSBundle mainBundle].infoDictionary[CFBundleVersion];
    // 将当前版本号存进沙盒
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:currentersion forKey:CFBundleVersion];
    [userDefault synchronize];
    // 第一次来。存个东西。方便给那些信用卡演示怎么使用
    NSString *first = HowToUse; // 怎么发帖
    NSUserDefaults *userDefaultFF = [NSUserDefaults standardUserDefaults];
    [userDefaultFF setObject:first forKey:HowToUse];
    [userDefaultFF synchronize];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.6;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:animation forKey:nil];
    
    window.rootViewController = tabbar;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

@end
