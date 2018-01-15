//
//  AlertViewShowTool.h
//  FrameworkTest
//
//  Created by KODIE on 2018/1/12.
//  Copyright © 2018年 kodie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertViewShowTool : NSObject
+ (instancetype)defaultTool;
- (void)showAlert;
- (void)showAlertWithMessage:(NSString *)message;

- (void)removeAlert;
@end
