//
//  CMHKFontManager.h
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Macro
#define MAIN_TEXT_NORMAL_FONT @"Avenir-Book"
#define MAIN_TEXT_MIDDLE_FONT @"Avenir-Medium"
#define MAIN_TEXT_BOLD_FONT @"Avenir-Heavy"

// for Bold
#define BoldMainNavTitleFont [UIFont fontWithName:MAIN_TEXT_BOLD_FONT size:17.0f]

// for Middle
#define MiddleMainTextFont [UIFont fontWithName:MAIN_TEXT_MIDDLE_FONT size:16.0f]
#define MiddleSubTextFont [UIFont fontWithName:MAIN_TEXT_MIDDLE_FONT size:12.0f]

// for Normal
#define NormalMainTextFont [UIFont fontWithName:MAIN_TEXT_NORMAL_FONT size:14.0f]
#define NormalSubTextFont [UIFont fontWithName:MAIN_TEXT_NORMAL_FONT size:12.0f]
#define NormalMainNavButtonFont [UIFont fontWithName:MAIN_TEXT_NORMAL_FONT size:15.0f]

@interface CMHKFontManager : NSObject

// for Bold
+(UIFont *)boldMainNavTitleFont;

// for Middle
+(UIFont *)middleMainTextFont;
+(UIFont *)middleSubTextFont;

// for Normal
+(UIFont *)normalMainTextFont;
+(UIFont *)normalSubTextFont;
+(UIFont *)normalMainNavButtonFont;

@end

NS_ASSUME_NONNULL_END
