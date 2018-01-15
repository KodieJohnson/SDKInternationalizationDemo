//
//  UIView+CurrentView.m
//  UIView-WZB
//
//  Created by KODIE on 2016/12/14.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "UIView+KODCurrentView.h"

@implementation UIView (KODCurrentView)

///拿到当前的窗口
- (UIWindow *)getWindow{
    return [[UIApplication sharedApplication] keyWindow];
}


///拿到当前显示的控制器的View。不建议直接放到window上，这样的话，如果倒计时不结束视图就跳转，倒计时不会停止移除
- (UIView *)getCurrentView {
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController].view;
    
}

///拿到当前控制器
- (UIViewController *)getCurrentController{
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController];
}

/// 这个方法是拿到当前正在显示的控制器，不管是push进去的，还是present进去的都能拿到，相信很多项目会用到。拿去不谢！
- (UIViewController *)getVisibleViewControllerFrom:(UIViewController*)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController*) vc) visibleViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]){
        return [self getVisibleViewControllerFrom:[((UITabBarController*) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

///拿到当前的窗口
+ (UIWindow *)getWindow{
    return [[UIApplication sharedApplication] keyWindow];
}

///得到当前控制器的视图
+ (UIView *)getCurrentView{
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController].view;
}
///得到当前显示控制器
+ (UIViewController *)getCurrentController{
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController];
}
/// 这个方法是拿到当前正在显示的控制器，不管是push进去的，还是present进去的都能拿到，相信很多项目会用到。拿去不谢！
+ (UIViewController *)getVisibleViewControllerFrom:(UIViewController*)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController*) vc) visibleViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]){
        return [self getVisibleViewControllerFrom:[((UITabBarController*) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

@end
