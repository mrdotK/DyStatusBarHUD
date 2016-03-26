//
//  ViewController.m
//  DyStatusBarHUDExamples
//
//  Created by MrdotK on 16/3/26.
//  Copyright (c) 2016年 MrdotK. All rights reserved.
//

#import "ViewController.h"
#import "DyStatusBarHUD.h"
@interface ViewController ()

@end

static UIWindow* window_;

@implementation ViewController

- (void)viewDidLoad {
    
}

-(IBAction)success{
    [DyStatusBarHUD showMessage:[UIImage imageNamed:@"DyStatusBarHUD.bundle/success"] message:@"加载成功"];
}
- (IBAction)failure {
    [DyStatusBarHUD showMessage:[UIImage imageNamed:@"DyStatusBarHUD.bundle/error"] message:@"加载失败"];
}
- (IBAction)loading {
    [DyStatusBarHUD showLoading:@"正在加载"];
    
}
- (IBAction)message {
    [DyStatusBarHUD showMessage:@"欢迎来到胥渡吧"];
}
- (IBAction)hidden {
    [DyStatusBarHUD hidden];
}

@end
