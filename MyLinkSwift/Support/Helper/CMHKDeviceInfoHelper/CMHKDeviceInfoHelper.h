//
//  CMHKDeviceInfoHelper.h
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMHKDeviceInfoHelper : NSObject

//for iPhone5 checking
+ (BOOL)isIPhone5;

//for iPhoneX checking
+ (BOOL)isIPhoneX;

+ (CGFloat)osVersionFloat;

+ (NSString *)osVersion;

+ (NSString *)osOperatingSystemVersion;

+ (NSString *)appVersion;

+ (NSString *)appBundleVersion;

+ (NSString *)deviceID;
    
+ (NSString *)GITHash;

+ (NSString *)countryCode;

+ (NSString *)getDeviceSystemLanguageCode;

//for helping to convert version string to comparable version number
//"1.1.0" to "1001000"
+ (NSUInteger)getVersionNumber:(NSString *)version;

@end

NS_ASSUME_NONNULL_END
