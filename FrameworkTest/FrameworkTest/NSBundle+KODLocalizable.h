//
//  NSBundle+KODLocalizable.h
//  KODLocalizable
//
//  Created by kodie on 17/10/10.
//  Copyright © 2017年 KODIE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (KODLocalizable)
+ (instancetype)KOD_localizableBundleWithBundleName:(NSString *)bundleName;
+ (NSString *)KOD_localizedStringForKey:(NSString *)key value:(NSString *)value;
+ (NSString *)KOD_localizedStringForKey:(NSString *)key;
@end
