//
//  NSBundle+DSADLocalizable.m
//  DSADLocalizable
//
//  Created by kodie on 17/10/10.
//  Copyright © 2017年 KODIE. All rights reserved.
//

#import "NSBundle+KODLocalizable.h"
#import "FrameworkTest.h"

@implementation NSBundle (KODLocalizable)
+ (instancetype)KOD_localizableBundleWithBundleName:(NSString *)bundleName{
    static NSBundle *localizableBundle = nil;
    if (localizableBundle == nil) {
        if (!bundleName) {
            bundleName = kKODBundleName;
        }
        NSString *bundleType = nil;
        if (bundleName && ![bundleName hasSuffix:@"bundle"]) {
            bundleType = @"bundle";
        }
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:bundleType];
        localizableBundle = [NSBundle bundleWithPath:bundlePath];
    }
    return localizableBundle;
}

+ (NSString *)KOD_localizedStringForKey:(NSString *)key{
    return [self KOD_localizedStringForKey:key value:nil];
}

+ (NSString *)KOD_localizedStringForKey:(NSString *)key value:(NSString *)value{
    NSBundle *bundle = nil;
    //（iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理,以下是读取系统当前使用语言
    //NSString *language = [self getLanguageFromSystem];
    //NSString *language = [self getLanguageFromPlist];
    NSString * language = [self getLanguageFromDevelopersSetup];
    if (!language) {
        language = [self getLanguageFromSystem];
    }
    //从DeepseagameAdSDKResource.bundle中查找资源
    NSString *bundlePath = [[NSBundle KOD_localizableBundleWithBundleName:nil] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:bundlePath];
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

+ (NSString *)getLanguageFromSystem{
    //（iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理,以下是读取系统当前使用语言
    NSString *language = [NSLocale preferredLanguages].firstObject;
    if ([language hasPrefix:@"en"]) {
        language = @"en";
    } else if ([language hasPrefix:@"zh"]) {
        if ([language rangeOfString:@"Hans"].location != NSNotFound) {
            language = @"zh-Hans"; // 简体中文
        } else { // zh-Hant\zh-HK\zh-TW
            language = @"zh-Hant"; // 繁體中文
        }
    } else {
        language = @"en";
    }
    return language;
}

+ (NSString *)getLanguageFromPlist{
    //加载plist文件
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"DeepseagameAdSDKConfig.plist" ofType:nil];
    if (!bundlePath) {
        return nil;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:bundlePath];
    if (dict) {
        NSInteger languageNum = [[dict valueForKey:@"language"] integerValue];
        switch (languageNum) {
            case 1:
                //语言为英语：en
                return @"en";
                break;
            case 2:
                //语言为简中：zh-Hans
                return @"zh-Hans";
                break;
            case 3:
                //语言为繁中：zh-Hanz
                return @"zh-Hant";
                break;
            default:
                return @"en";
                break;
        }
    }
    return @"en";
}

+ (NSString *)getLanguageFromDevelopersSetup{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger languageStyle = [[userDefaults valueForKey:kDSADLanguageStyle] integerValue];
    if (!languageStyle) {
        return nil;
    }
    switch (languageStyle) {
        case 1:
            return @"en";
            break;
        case 2:
            return @"zh-Hans";
            break;
        case 3:
            return @"zh-Hant";
            break;
        default:
            return @"en";
            break;
    }
}

@end
