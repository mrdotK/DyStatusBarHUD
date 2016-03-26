//
//  DyStatusBarHUD.h
//  DyStatusBarHUD
//
//  Created by MrdotK on 16/3/26.
//  Copyright (c) 2016年 MrdotK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DyStatusBarHUD : NSObject

/**
 * 显示加载普通文字
 */
+(void)showMessage:(NSString*)msg;
/**
 * 显示加载普通文字和图片
 */
+(void)showMessage:(UIImage*)image message:(NSString*)msg;
/**
 * 显示加载成功
 */
+(void)showSuccess:(NSString*)msg;

/**
 * 显示加载失败
 */
+(void)showError:(NSString*)msg;

/**
 * 显示正在加载
 */
+(void)showLoading:(NSString*)msg;

/**
 * 隐藏窗口
 */
+(void)hidden;


@end
