//
//  CMHKDeviceInfoHelper.m
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import "CMHKDeviceInfoHelper.h"

// Frameworks
#import <AVFoundation/AVFoundation.h>
#import <sys/utsname.h>

// Helper
#import "CMHKLocalizeHelper.h"

// Constant
static int const kVersionNumberFactor = 1000;
static CGFloat const kIPhone5MainScreenHeight = 568.0f;

#warning CD - Temp code, we need to take care of iPhoneX plus
static CGFloat const kIPhoneXMainScreenHeight = 812.0f;
static CGFloat const kIPhoneXSMaxMainScreenHeight = 896.0f;

@implementation CMHKDeviceInfoHelper

#pragma mark - Public

//for iPhone5 checking
+ (BOOL)isIPhone5 {

    BOOL iPhone5 = NO;
    if ([UIScreen mainScreen].bounds.size.height == kIPhone5MainScreenHeight) {
        
        iPhone5 = YES;
    }
    return iPhone5;
}

//for iPhoneX checking
+ (BOOL)isIPhoneX {
    
    BOOL iPhoneX = NO;
    if ([UIScreen mainScreen].bounds.size.height == kIPhoneXMainScreenHeight || [UIScreen mainScreen].bounds.size.height == kIPhoneXSMaxMainScreenHeight) {
        
        iPhoneX = YES;
    }
    NSLog(@"isIPhoneX %d [UIScreen mainScreen].bounds.size.height %f", iPhoneX,  [UIScreen mainScreen].bounds.size.height);
    return iPhoneX;
}

+ (CGFloat)osVersionFloat {
    
    NSString *osVersionString = [[UIDevice currentDevice] systemVersion];
    NSLog(@"osVersionString %@", osVersionString);
    return [osVersionString floatValue];
}

+ (NSString *)osVersion {
    
    //eg ios11.2 -> 11.0000
    return [NSString stringWithFormat:@"%f", [CMHKDeviceInfoHelper osVersionFloat]];
}

+ (NSString *)osOperatingSystemVersion {
    
    //eg ios11.2 -> 11.2
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)appVersion {
    
    NSString *appVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"appVersionString %@", appVersionString);
    return appVersionString;
}

+ (NSString *)appBundleVersion {
    
    NSString *appBundleVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSLog(@"appBundleVersionString %@", appBundleVersionString);
    return appBundleVersionString;
}

//for loading the deviceID
+ (NSString *)deviceID {
    
    CFStringRef cfUuid = CFUUIDCreateString(NULL, CFUUIDCreate(NULL));
    NSString *deviceUUID = (__bridge NSString *)cfUuid;
    NSLog(@"deviceUUID %@", deviceUUID);
    return deviceUUID;
}
    
+ (NSString *)GITHash {
    
    NSString *GITHash = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"GITHash"];
    NSLog(@"GITHash %@", GITHash);
    return GITHash;
}

+ (NSString *)countryCode
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];
    NSLog(@"countryCode %@", countryCode);
    return countryCode;
}

+ (NSString *)getDeviceSystemLanguageCode
{
    NSString *current_language = [[NSLocale preferredLanguages] firstObject];
    NSLog(@"[NSLocale preferredLanguages] %@", [NSLocale preferredLanguages]);
    
    if ([current_language hasPrefix:LANG_CNT]) {
        
        current_language = LANG_CNT;
        
    } else if ([current_language hasPrefix:LANG_CNS]) {
        
        current_language = LANG_CNS;
        
    } else if ([current_language hasPrefix:LANG_TC]) {
        
        current_language = LANG_CNT;
        
    } else {
        
        current_language = LANG_EN;
    }
    return current_language;
}

// for helping to convert version string to comparable version number
//"1.1.0" to "1001000"
+ (NSUInteger)getVersionNumber:(NSString *)version {
    
    NSUInteger first = 0;
    NSUInteger second = 0;
    NSUInteger third = 0;
    NSUInteger total = 0;
    
    NSArray *array = [version componentsSeparatedByString:@"."];
    first = [[array objectAtIndex:0] integerValue] * kVersionNumberFactor * kVersionNumberFactor;
    
    if ([array count] > 1) {
        
        second = [[array objectAtIndex:1] integerValue] * kVersionNumberFactor;
    }
    
    if ([array count] > 2) {
        
        third = [[array objectAtIndex:2] integerValue];
    }
    
    total = first + second + third;
    return total;
}

@end
