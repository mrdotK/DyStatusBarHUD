//
//  DyStatusBarHUD.m
//  DyStatusBarHUD
//
//  Created by MrdotK on 16/3/26.
//  Copyright (c) 2016年 MrdotK. All rights reserved.
//

#import "DyStatusBarHUD.h"
#define screenW  [UIScreen mainScreen].bounds.size.width
#define screenH  [UIScreen mainScreen].bounds.size.height

static UIWindow* window_;
static NSTimer* timer_;
@implementation DyStatusBarHUD

+(void)showWindow{
    
    //防止上次的窗口显示还有残留
    window_.hidden = YES;
    window_ = [[UIWindow alloc] initWithFrame:CGRectMake(0, -20, screenW, 20)];
    window_.backgroundColor = [UIColor blackColor];
    //设置最高级别，让别的窗口无法盖住此通知窗口
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        window_.frame = CGRectMake(0, 0, screenW, 20);
    } completion:nil];
}
/**
 * 显示加载普通文字
 */
+(void)showMessage:(NSString*)msg
{
    [self showMessage:nil message:msg];
}
+(void)showMessage:(UIImage*)image message:(NSString*)msg{
    [timer_ invalidate];
    [self showWindow];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    btn.userInteractionEnabled = NO;
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    [window_ addSubview:btn];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hidden) userInfo:nil repeats:NO];
}


/**
 * 显示加载成功
 */
+(void)showSuccess:(NSString*)msg
{
    [self showMessage:[UIImage imageNamed:@"success"] message:msg];
}

/**
 * 显示加载失败
 */
+(void)showError:(NSString*)msg
{
    [self showMessage:[UIImage imageNamed:@"error"] message:msg];
}

/**
 * 显示正在加载
 */
+(void)showLoading:(NSString*)msg
{
    //先暂停定时器，否则上一次的动画后的2秒后会隐藏window
    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
    
    UILabel* label = [[UILabel alloc] init];
    label.text = @"正在加载...";
    CGFloat width = [label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}].width;
    label.frame = window_.bounds;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:14]];
    [window_ addSubview:label];
    
    UIActivityIndicatorView* load=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat centerX = (window_.frame.size.width-width)*0.5 - 15;
    CGFloat centerY = window_.frame.size.height*0.5;
    CGFloat widthLoad=window_.frame.size.height*0.5;
    load.frame = CGRectMake(0,0,widthLoad, widthLoad);
    load.center = CGPointMake(centerX, centerY);
    [load startAnimating];
    [window_ addSubview:load];
}

/**
 * 隐藏窗口
 */
+(void)hidden
{
    window_.hidden = YES;
    window_ = nil;
}
@end
