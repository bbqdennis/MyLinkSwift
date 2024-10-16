//
//  CMHKStringHelper.h
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 30/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMHKStringHelper : NSObject

+ (BOOL)isEmptyString:(NSString *)aString;
+ (BOOL)isEnglishWord:(NSString *)candidate;
+ (BOOL)isValidNameWord:(NSString *)candidate;
+ (BOOL)isValidDisplayNameWordFinal:(NSString *)candidate;
+ (BOOL)isValidEmailWord:(NSString *)candidate;
+ (BOOL)isValidEmailFinal:(NSString *)candidate;
+ (BOOL)isValidPasswordWord:(NSString *)candidate;
+ (BOOL)isValidCommentWord:(NSString *)candidate;

+ (NSString *)renewNewString:(NSString *)newString;
+ (NSString *)trimString:(NSString *)aString;
+ (NSString *)trimStringEX:(NSString *)aString;
+ (NSString *)replaceStringToNameFormat:(NSString *)userName;
+ (NSString *)encodeURLString:(NSString *)urlString;
+ (NSString *)decodeURLString:(NSString *)urlString;
// it will copy the target string if aString != nil and aString.length > 0 only
// otherwise, it will return @"" instead
+ (NSString *)copyStringWithString:(NSString *)aString;

+ (float)getStringHeight:(UILabel *)label andWidth:(float)width;
+ (float)getStringHeightByString:(NSString *)aString andFont:(UIFont*)font andWidth:(float)width;
+ (float)getStringWidth:(UILabel *)label andHeight:(float)height;
+ (float)getStringWidthByString:(NSString *)aString andFont:(UIFont*)font andHeight:(float)height;

@end

NS_ASSUME_NONNULL_END
