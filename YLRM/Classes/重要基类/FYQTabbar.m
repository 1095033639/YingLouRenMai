//
//  FYQTabbar.m
//  佛友圈
//
//  Created by Chan_Sir on 16/4/13.
//  Copyright © 2016年 陈振超. All rights reserved.
//

#import "FYQTabbar.h"

@interface FYQTabbar ()

/** 发文按钮 */
@property (weak,nonatomic) UIButton *sendBtn;

@end

@implementation FYQTabbar

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIButton *sendBtn = [[UIButton alloc]init];
        [sendBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [sendBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [sendBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateNormal];
        [sendBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        sendBtn.size = sendBtn.currentBackgroundImage.size;
        [sendBtn addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sendBtn];
        self.sendBtn = sendBtn;
    }
    return self;
}

- (void)sendClick:(UIButton *)sender
{
    if ([self.sendDelegate respondsToSelector:@selector(tabbarDidClickSendBtn:)]) {
        [self.sendDelegate tabbarDidClickSendBtn:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
    self.sendBtn.centerX = self.width * 0.5;
    self.sendBtn.centerY = self.height * 0.5;
    
    // 2.设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            child.width = tabbarButtonW;
            // 设置x
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }

}

@end
