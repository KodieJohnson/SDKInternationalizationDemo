//
//  AppDelegate.m
//  SDKInternationalizationDemo
//
//  Created by KODIE on 2018/1/15.
//  Copyright © 2018年 kodie. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc] init];
    
    _window.rootViewController = vc;
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
