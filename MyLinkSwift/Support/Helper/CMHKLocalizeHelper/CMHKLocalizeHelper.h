//
//  CMHKLocalizeHelper.h
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Macro

// system lang code
#define LANG_CNS @"zh-Hans"
#define LANG_CNT @"zh-Hant"

// server lang code
#define LANG_TC @"tc"
#define LANG_SC @"sc"
#define LANG_EN @"en"

#define CMHKLocalizedString(key) [[CMHKLocalizeHelper sharedInstance] getStringForKey:key]

// for notification
#define NOTIFICATION_LANGUAGE_CHANGED @"NOTIFICATION_LANGUAGE_CHANGED"

typedef enum
{
    LanguageTo_CNS,
    LanguageTo_CNT,
    LanguageTo_EN
} LanguageTo;

@interface CMHKLocalizeHelper : NSObject

+(instancetype)sharedInstance;

+(NSString *)getCMHKLocalizedString:(NSString *)key;

-(BOOL)hvSelectedLanguage;
-(BOOL)shouldUseEnglish;

// for getting back the system lang code, eg. @"zh-Hans" or @"zh-Hant" or "en"
-(NSString *)getSystemLanguageCode;

// for getting back the server lang code, eg. @"zh" or "gb" or "en" value for setting to profile "language" field to server side
-(NSString *)getServerLanguageCode;
-(NSString *)getStringForKey:(NSString *)key;
-(NSString *)getSystemLanguageCodeWithServerLanguageCode:(NSString *)languageCode;
-(NSString *)getServerLanguageCodeWithSystemLanguageCode:(NSString *)languageCode;

-(void)changeLanguageTo:(LanguageTo)aLanguageTo;
-(void)changeLanguageWithServerLanguageCode:(NSString *)languageCode;

@end

NS_ASSUME_NONNULL_END
