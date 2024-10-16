//
//  CMHKStringHelper.m
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 30/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

#import "CMHKStringHelper.h"

// Constants
static const int kMinimumNameLimitCount = 5;
static const int kMaximumNameLimitCount = 20;
static const int kMaximumPasswordLimitCount = 20;
static const int kMaximumCommentTextFieldLimitCount = 1000;
static const int kMinimumDisplayNameLimitCount = 2;
static const int kMaximumDisplayNameLimitCount = 50;

// Macro
#define kNameRegex @"^[A-Za-z0-9_]{0,%d}$"
#define kEmailPrefixRegex @"[A-Za-z0-9_+-.]"
#define kEmailRegex @"[A-Za-z0-9._+-]"
#define kEmailFullRegex @"^%@{0,30}[@]{0,1}%@{0,40}[.]{0,1}%@{0,40}$"
#define kPasswordRegex @"^[A-Za-z0-9@._+-%?=.*?#?!@$&*-]{0,%d}$"
#define kFinalEmailRegex @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
#define kFinalNameRegex @"^[A-Za-z0-9_]{5,20}$"

@implementation CMHKStringHelper

#pragma mark - Helper

+ (BOOL)getMatchResultWithRegex:(NSString *)aRegex withCheckString:(NSString *)checkString
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", aRegex];
    BOOL isMatch = [pred evaluateWithObject:checkString];
    return isMatch;
}


#pragma mark - Public

+ (BOOL)isEmptyString:(NSString *)aString {
    
    BOOL isEmpty = YES;
    
    if (!aString || [aString isEqual:[NSNull null]]) {
    
        isEmpty = YES;
        
    } else if ([aString isKindOfClass:[NSString class]]) {
        
        if ([aString isEqualToString:@""]) {
            
            isEmpty = YES;
            
        } else {
            
            isEmpty = NO;
        }
        
    } else if ([aString isKindOfClass:[NSNumber class]]) {
        
        isEmpty = NO;
        
    } else {
        
        if(aString.length <= 0) {
            
            isEmpty = YES;
            
        } else {
            
            isEmpty = NO;
        }
    }
    return isEmpty;
}

+ (BOOL)isEnglishWord:(NSString *)candidate
{
#warning CD - Temp code, not yet completed, waiting for any special character code which should also be excluded
    NSString *regex = @"[A-Z0-9a-z#]";
    return [CMHKStringHelper getMatchResultWithRegex:regex withCheckString:candidate];
}

+ (BOOL)isValidNameWord:(NSString *)candidate
{
    NSString *regex = [NSString stringWithFormat:kNameRegex,kMaximumNameLimitCount];
    return [CMHKStringHelper getMatchResultWithRegex:regex withCheckString:candidate];
}

+ (BOOL)isValidDisplayNameWordFinal:(NSString *)candidate
{
    BOOL isValid = YES;
    
    if (candidate.length < kMinimumDisplayNameLimitCount) {
        
        isValid = NO;
        
    } else if (candidate.length > kMaximumDisplayNameLimitCount) {
        
        isValid = NO;
    }
    return isValid;
}

+ (BOOL)isValidEmailWord:(NSString *)candidate
{
//    kMaximumEmailLimitCount
    NSString *regex = [NSString stringWithFormat:kEmailFullRegex,kEmailPrefixRegex,kEmailRegex,kEmailRegex];
    return [CMHKStringHelper getMatchResultWithRegex:regex withCheckString:candidate];
}

+ (BOOL)isValidEmailFinal:(NSString *)candidate
{
    return [CMHKStringHelper getMatchResultWithRegex:kFinalEmailRegex withCheckString:candidate];
}

+ (BOOL)isValidPasswordWord:(NSString *)candidate
{
//    [^\p{L}\d\s_]
    NSString *regex = [NSString stringWithFormat:kPasswordRegex, kMaximumPasswordLimitCount];
    return [CMHKStringHelper getMatchResultWithRegex:regex withCheckString:candidate];
}

+ (BOOL)isValidCommentWord:(NSString *)candidate
{
    return candidate.length <= kMaximumCommentTextFieldLimitCount;
}

+ (NSString *)renewNewString:(NSString *)newString
{
    return ([self isEmptyString:newString]) ? @"" : newString;
}

//for triming the string
+ (NSString *)trimString:(NSString *)aString
{
    NSString *newString = [aString stringByReplacingOccurrencesOfString:@"    " withString:@""];
    newString = [newString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return newString;
}

//for triming the string without spacing also
+ (NSString *)trimStringEX:(NSString *)aString
{
    NSString *newString = [aString stringByReplacingOccurrencesOfString:@"    " withString:@""];
    newString = [aString stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString = [newString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return newString;
}

+ (NSString *)replaceStringToNameFormat:(NSString *)userName
{
    userName = [userName stringByReplacingOccurrencesOfString:@"  " withString: @" "].lowercaseString;
    userName = [userName stringByReplacingOccurrencesOfString:@" " withString: @"_"].lowercaseString;
    
    userName = [userName substringToIndex:(userName.length < kMaximumNameLimitCount) ? userName.length : kMaximumNameLimitCount];
    
    BOOL isValid = [CMHKStringHelper isValidNameWord:userName];
    
    return isValid ? userName : @"";
}

+ (NSString *)encodeURLString:(NSString *)urlString
{
    return [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

+ (NSString *)decodeURLString:(NSString *)urlString
{
    return [urlString stringByRemovingPercentEncoding];
}

+ (NSString *)copyStringWithString:(NSString *)aString
{
    NSString *newString = @"";
    
    if (aString != nil && aString.length > 0) {
        
        newString = aString;
    }
    return newString;
}

+ (float)getStringHeight:(UILabel *)label andWidth:(float)width
{
    if (label == nil) {
        
        NSLog(@"Crash with nil - %@",label);
    }
    return [self getHeight:label.text andLineBreakMode:label.lineBreakMode andFont:label.font andWidth:width];
}

+ (float)getStringHeightByString:(NSString *)aString andFont:(UIFont *)font andWidth:(float)width
{
    return [self getHeight:aString andLineBreakMode:NSLineBreakByWordWrapping andFont:font andWidth:width];
}

+ (float)getHeight:(NSString*)aString andLineBreakMode:(NSLineBreakMode)aLineBreakMode andFont:(UIFont *)font andWidth:(float)width
{
    // for nil aString protection
    aString = aString == nil ? aString = @"" : aString;
    CGFloat height = [aString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font}
                                           context:nil].size.height;
    //printf("getHeight aString %s width %f height %f\n", [[aString substringToIndex:6] UTF8String], width, height);
    return ceilf(height);
}

+ (float)getStringWidth:(UILabel *)label andHeight:(float)height
{
    if (label == nil) {
        
        NSLog(@"Crash with nil - %@",label);
        return 0.0f;
    }
    return [self getWidth:label.text andLineBreakMode:label.lineBreakMode andFont:label.font andHeight:height];
}

+ (float)getStringWidthByString:(NSString *)aString andFont:(UIFont *)font andHeight:(float)height
{
    return [self getWidth:aString andLineBreakMode:NSLineBreakByWordWrapping andFont:font andHeight:height];
}

+ (float)getWidth:(NSString *)aString andLineBreakMode:(NSLineBreakMode)aLineBreakMode andFont:(UIFont *)font andHeight:(float)height
{
    // for nil aString protection
    aString = aString == nil ? aString = @"" : aString;
    return [aString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName:font}
                                 context:nil].size.width;
}

// get limit numbers


+ (int)getMinimumNameLimitCount {

return kMinimumNameLimitCount;

}

+ (int)getMaximumNameLimitCount {

    return kMaximumNameLimitCount;

}

+ (NSString *)changeNumberFormatterInThousands:(NSString*)aString
{
    NSString *resultString = @"";
    NSString *numString = [NSString stringWithFormat:@"%@",aString];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    resultString = [formatter stringFromNumber:number];
    NSLog(@"changeNumberFormatterInThousands resultString == %@",resultString);
    
    if ([CMHKStringHelper isEmptyString:resultString]) {
        
        return aString;
    }
    return resultString;
}


@end
