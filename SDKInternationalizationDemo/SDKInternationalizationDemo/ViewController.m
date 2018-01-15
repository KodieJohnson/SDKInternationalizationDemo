//
//  ViewController.m
//  SDKInternationalizationDemo
//
//  Created by KODIE on 2018/1/15.
//  Copyright © 2018年 kodie. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <FrameworkTest/FrameworkTest.h>

typedef enum : NSUInteger {
    DSADLanguageStyleEnglish = 1000,
    DSADLanguageStyleChineseSimplified = 2000,
    DSADLanguageStyleChineseTraditional = 3000
} DSADLanguageStyle;

#define kDSADLanguageStyle @"DSADLanguageStyle"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initConfig];
    
    [self addConfigLanguageBtnWithTitle:@"点我配置英语" originY:500 tag:DSADLanguageStyleEnglish];
    [self addConfigLanguageBtnWithTitle:@"点我配置简体中文" originY:575 tag:DSADLanguageStyleChineseSimplified];
    [self addConfigLanguageBtnWithTitle:@"点我配置繁体中文" originY:650 tag:DSADLanguageStyleChineseTraditional];
}

- (void)initConfig{
    self.view.backgroundColor = [UIColor colorWithRed:218/255.0 green:98/255.0 blue:73/255.0 alpha:1.0];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[AlertViewShowTool defaultTool] showAlert];
}

- (void)addConfigLanguageBtnWithTitle:(NSString *)title originY:(CGFloat)y tag:(DSADLanguageStyle)style{
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, y, 200, 50);
    CGFloat btnCenterX = self.view.center.x;
    CGFloat btnCenterY = btn.frame.origin.y + btn.frame.size.height * 0.5;
    CGPoint btnCenter = CGPointMake(btnCenterX, btnCenterY);
    btn.center = btnCenter;
    btn.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    btn.tag = style;
    [self.view addSubview:btn];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:218/255.0 green:98/255.0 blue:73/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(didClickLanguageBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickLanguageBtn:(UIButton *)sender{
    [self configSDKLanguageWithLanguageStyle: sender.tag];
    
    [[AlertViewShowTool defaultTool] removeAlert];
    [[AlertViewShowTool defaultTool] showAlert];
}

- (void)configSDKLanguageWithLanguageStyle:(DSADLanguageStyle)style{
    switch (style) {
        case DSADLanguageStyleEnglish:
            [[NSUserDefaults standardUserDefaults]setValue:@(1) forKey:kDSADLanguageStyle];
            break;
        case DSADLanguageStyleChineseSimplified:
            [[NSUserDefaults standardUserDefaults]setValue:@(2) forKey:kDSADLanguageStyle];
            break;
        case DSADLanguageStyleChineseTraditional:
            [[NSUserDefaults standardUserDefaults]setValue:@(3) forKey:kDSADLanguageStyle];
            break;
        default:
            [[NSUserDefaults standardUserDefaults]setValue:@(1) forKey:kDSADLanguageStyle];
            break;
    }
}

@end
