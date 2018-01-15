//
//  NSBundle+KODLocalizable.m
//  KODLocalizable
//
//  Created by kodie on 17/10/10.
//  Copyright © 2017年 KODIE. All rights reserved.
//

#import "NSBundle+KODLocalizable.h"
#define kKODBundleName @"FrameworkTestBundle.bundle"
#define kDSADLanguageStyle @"DSADLanguageStyle"

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
    //NSString *language = [self getLanguageFromSystem];
    //NSString *language = [self getLanguageFromPlist];
    NSString * language = [self getLanguageFromDevelopersSetup];
    if (!language) {
        language = [self getLanguageFromSystem];
    }
    //从FrameworkTestBundle.bundle中查找资源
    NSString *bundlePath = [[NSBundle KOD_localizableBundleWithBundleName:nil] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:bundlePath];
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

//这个设置语言是通过读取当前系统使用语言
+ (NSString *)getLanguageFromSystem{
    NSString *language = [NSLocale preferredLanguages].firstObject;
    if ([language hasPrefix:@"en"]) {
        language = @"en";
    } else if ([language hasPrefix:@"zh"]) {
        if ([language rangeOfString:@"Hans"].location != NSNotFound) {
            language = @"zh-Hans"; // 简体中文
        } else {
            language = @"zh-Hant"; // 繁體中文
        }
    } else {
        language = @"en";
    }
    return language;
}

//这个是设置语言通过Plist文件来读取
+ (NSString *)getLanguageFromPlist{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"SDKInternationalizationDemoPlist.plist" ofType:nil];
    if (!bundlePath) {
        return nil;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:bundlePath];
    if (dict) {
        NSInteger languageNum = [[dict valueForKey:@"language"] integerValue];
        switch (languageNum) {
            case 1:
                return @"en";     //语言为英语：en
                break;
            case 2:
                return @"zh-Hans";//语言为简中：zh-Hans
                break;
            case 3:
                return @"zh-Hant";//语言为繁中：zh-Hanz
                break;
            default:
                return @"en";
                break;
        }
    }
    return @"en";
}

//这个是设置语言通过开发者手动调用，从NSUserDefaults里面去读kDSADLanguageStyle这个字段是哪一种语言
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
