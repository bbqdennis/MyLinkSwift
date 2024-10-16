//
//  CMHKLocalizeHelper.m
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import "CMHKLocalizeHelper.h"

// Helper
#import "CMHKDeviceInfoHelper.h"

// Constants
static const NSString * kLocalizedFileName = @"Localizable";

// Macro
#define LOCALIZE_FROM @"Localizable"
#define LOCALIZE_LANGUAGE_KEY @"current_localizable_language"

@interface CMHKLocalizeHelper ()
{
    NSString *currentServerLanguageCode;
}

@property (nonatomic,strong) NSBundle *bundle;
@property (nonatomic,strong) NSString *systemLanguageCode;

-(void)readyInit;

@end

@implementation CMHKLocalizeHelper

#pragma mark - Variable

-(NSDictionary *)languageDict
{
    return @{
             LANG_TC : LANG_CNT,
             LANG_SC : LANG_CNS,
             LANG_EN : LANG_EN,
             };
}

-(NSDictionary *)serverLanguageDict
{
    return @{
             LANG_CNT : LANG_TC,
             LANG_CNS : LANG_SC,
             LANG_EN : LANG_EN
             };
}


#pragma mark - Singleton

+ (instancetype)sharedInstance {
    
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Init

-(instancetype)init
{
    if (self = [super init]) {
        
        [self readyInit];
    }
    return self;
}

-(void)readyInit
{
    [self setupLanguage];
    self.bundle = [self getBundleByString:self.systemLanguageCode];
    NSLog(@"self.systemLanguageCode %@ self.bundle %@", self.systemLanguageCode, self.bundle);
}

-(void)setupLanguage
{
    [self loadSystemLanguageCode];
    
    if (self.systemLanguageCode.length == 0) {
        
        self.systemLanguageCode = [CMHKDeviceInfoHelper getDeviceSystemLanguageCode];
        [self saveSystemLanguageCode];
        // sync back LanguageSelectDetailModel also
        [self syncBackCurrentServerLanguageCode];
    }
}


#pragma mark - Helper

-(NSBundle *)getBundleByString:(NSString *)pathForResource
{
    NSString *path = [[NSBundle mainBundle] pathForResource:pathForResource ofType:@"lproj"];
    return  [NSBundle bundleWithPath:path];
}

-(NSString *)subRenewLanguageCode:(NSString *)language
{
    NSString *newLanguageCode = language;
    
    if ([[self languageDict] objectForKey:language]) {
        
        newLanguageCode = [[self languageDict] objectForKey:language];
    }
    NSLog(@"subRenewLanguageCode %@ newLanguageCode %@", language, newLanguageCode);
    return newLanguageCode;
}


#pragma mark - Common

-(NSString *)loadSystemLanguageCode
{
    self.systemLanguageCode = [[NSUserDefaults standardUserDefaults] objectForKey:LOCALIZE_LANGUAGE_KEY];
    return self.systemLanguageCode;
}

-(void)saveSystemLanguageCode
{
    [[NSUserDefaults standardUserDefaults] setObject:self.systemLanguageCode forKey:LOCALIZE_LANGUAGE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)syncBackCurrentServerLanguageCode
{
    NSLog(@"syncBackCurrentServerLanguageCode");
    currentServerLanguageCode = [self getServerLanguageCodeWithSystemLanguageCode:self.systemLanguageCode];
}

-(void)renewNewLanguageWithSystemLangCode:(NSString *)language
{
    if ([language isEqualToString:LANG_EN] || [language isEqualToString:LANG_CNS] || [language isEqualToString:LANG_CNT])
    {
        self.bundle = [self getBundleByString:language];
        self.systemLanguageCode = language;
        [self saveSystemLanguageCode];
        [self syncBackCurrentServerLanguageCode];
        [self postNotificationLanguageChanged];
    }
}

-(void)postNotificationLanguageChanged
{
    NSLog(@"postNotificationLanguageChanged");
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LANGUAGE_CHANGED object:nil userInfo:nil];
}


#pragma mark - Public

+(NSString *)getCMHKLocalizedString:(NSString *)key
{
    return CMHKLocalizedString(key);
}

-(BOOL)hvSelectedLanguage
{
    return [self loadSystemLanguageCode];
}

-(BOOL)shouldUseEnglish
{
    BOOL isEnglish = YES;
    
    if ([self.systemLanguageCode isEqualToString:LANG_CNS] || [self.systemLanguageCode isEqualToString:LANG_CNT]) {
        
        isEnglish = NO;
    }
    return isEnglish;
}

-(NSString *)getSystemLanguageCode
{
    return [self loadSystemLanguageCode];
}

-(NSString *)getServerLanguageCode
{
    if (currentServerLanguageCode == nil) {
        
        [self setupLanguage];
    }
    return currentServerLanguageCode;
}

-(NSString *)getStringForKey:(NSString *)key
{
    if (self.bundle) {
        
        return NSLocalizedStringFromTableInBundle(key, LOCALIZE_FROM, self.bundle, @"");
    }
    return NSLocalizedStringFromTable(key, LOCALIZE_FROM, @"");
}

-(NSString *)getSystemLanguageCodeWithServerLanguageCode:(NSString *)languageCode
{
    NSLog(@"getSystemLanguageCodeWithServerLanguageCode %@", languageCode);
    return [[self languageDict] objectForKey:languageCode] != nil ? [[self languageDict] objectForKey:languageCode] : LANG_EN;
}

-(NSString *)getServerLanguageCodeWithSystemLanguageCode:(NSString *)languageCode
{
    NSLog(@"getServerLanguageCodeWithSystemLanguageCode %@", languageCode);
    return [[self serverLanguageDict] objectForKey:languageCode] != nil ? [[self serverLanguageDict] objectForKey:languageCode] : LANG_EN;
}

-(void)changeLanguageTo:(LanguageTo)aLanguageTo
{
    NSLog(@"changeLanguageTo %ld", (long)aLanguageTo);
    
    if (aLanguageTo == LanguageTo_CNS) {
        
        [self renewNewLanguageWithSystemLangCode:LANG_CNS];
        
    } else if (aLanguageTo == LanguageTo_CNT)  {
        
        [self renewNewLanguageWithSystemLangCode:LANG_CNT];
        
    } else if (aLanguageTo == LanguageTo_EN) {
        
        [self renewNewLanguageWithSystemLangCode:LANG_EN];
    }
}

-(void)changeLanguageWithServerLanguageCode:(NSString *)languageCode
{
    NSLog(@"changeLanguageWithServerLanguageCode %@", languageCode);
    NSString *newLanguageCode = [self subRenewLanguageCode:languageCode];
    [self renewNewLanguageWithSystemLangCode:newLanguageCode];
}

@end
