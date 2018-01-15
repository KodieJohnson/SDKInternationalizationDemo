//
//  UIView+CurrentView.m
//  UIView-WZB
//
//  Created by KODIE on 2016/12/14.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "UIView+KODCurrentView.h"

@implementation UIView (KODCurrentView)

- (UIWindow *)getWindow{
    return [[UIApplication sharedApplication] keyWindow];
}
- (UIView *)getCurrentView {
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController].view;
    
}
- (UIViewController *)getCurrentController{
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController];
}

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


+ (UIWindow *)getWindow{
    return [[UIApplication sharedApplication] keyWindow];
}
+ (UIView *)getCurrentView{
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController].view;
}
+ (UIViewController *)getCurrentController{
    return [self getVisibleViewControllerFrom:(UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController];
}
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
