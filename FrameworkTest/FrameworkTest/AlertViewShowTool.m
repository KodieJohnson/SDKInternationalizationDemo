//
//  AlertViewShowTool.m
//  FrameworkTest
//
//  Created by KODIE on 2018/1/12.
//  Copyright © 2018年 kodie. All rights reserved.
//

#import "AlertViewShowTool.h"
#import "UIView+KODCurrentView.h"
#import "NSBundle+KODLocalizable.h"
#import "KODCommonConst.h"

@implementation AlertViewShowTool
+ (instancetype)defaultTool{
    static AlertViewShowTool *tool;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        tool = [[AlertViewShowTool alloc] init];
    });
    return tool;
}

- (void)removeAlert{
    UIView *currentView = [UIView getCurrentView];
    UIView *showView = [currentView viewWithTag:9999999];
    [showView removeFromSuperview];
}

- (void)showAlert{
    //创建一个View
    UIView *showView = [[UIView alloc] init];
    showView.frame = CGRectMake(0, 0, 200, 100);
    showView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    NSLog(@"keyWindow = %@",keyWindow);
    
    UIView *currentView = [UIView getCurrentView];
    [currentView addSubview:showView];
    showView.center = currentView.center;
    
    UILabel *showLabel = [[UILabel alloc] init];
    showLabel.textColor = [UIColor colorWithRed:218/255.0 green:98/255.0 blue:73/255.0 alpha:1.0];
    showLabel.frame = CGRectMake(0, 35, 200, 30);
    [showView addSubview:showLabel];
    showLabel.font = [UIFont systemFontOfSize:27];
    
    NSString *showText = [NSBundle KOD_localizedStringForKey: KODShowText];
    showLabel.text = showText;
    showLabel.textAlignment = NSTextAlignmentCenter;
    
    showView.tag = 9999999;
}

- (void)showAlertWithMessage:(NSString *)message{
    //创建一个View
    UIView *showView = [[UIView alloc] init];
    showView.frame = CGRectMake(0, 0, 200, 100);
    showView.backgroundColor = [UIColor orangeColor];
    
    UIView *currentView = [UIView getCurrentView];
    [currentView addSubview:showView];
    showView.center = currentView.center;
    
    UILabel *showLabel = [[UILabel alloc] init];
    showLabel.backgroundColor = [UIColor greenColor];
    showLabel.textColor = [UIColor whiteColor];
    showLabel.frame = CGRectMake(0, 35, 200, 30);
    [showView addSubview:showLabel];
    showLabel.font = [UIFont systemFontOfSize:27];
    
    showLabel.text = message;
    showLabel.textAlignment = NSTextAlignmentCenter;
}


@end
