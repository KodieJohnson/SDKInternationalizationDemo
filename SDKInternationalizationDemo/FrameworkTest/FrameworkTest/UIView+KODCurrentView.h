//
//  UIView+CurrentView.h
//  UIView-WZB
//
//  Created by KODIE on 2016/12/14.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KODCurrentView)

///拿到当前的窗口
- (UIWindow *)getWindow;

///得到当前控制器的视图
- (UIView *)getCurrentView;
///得到当前显示控制器
- (UIViewController *)getCurrentController;

///拿到当前的窗口
+ (UIWindow *)getWindow;

///得到当前控制器的视图
+ (UIView *)getCurrentView;
///得到当前显示控制器
+ (UIViewController *)getCurrentController;

@end
