//
//  CMHKColorManager.h
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 8/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMHKColorManager : NSObject

// Get color name : https://www.color-blindness.com/color-name-hue/

+(UIColor *)colorHelperRGB:(CGFloat)rgb;
+(UIColor *)colorHelperRGB:(CGFloat)rgb withAlpha:(CGFloat)alpha;
+(UIColor *)colorHelper:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue;
+(UIColor *)colorHelper:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue withAlpha:(CGFloat)alpha;

+(UIImage *)imageFromColor:(UIColor *)color;

// Normal Color
+(UIColor *)clear;
+(UIColor *)black;                              // 0, 0, 0
+(UIColor *)heavyAlphaBlack;                    // 0, 0, 0, 0.8
+(UIColor *)alphaBlack;                         // 0, 0, 0, 0.6
+(UIColor *)lightAlphaBlack;                    // 0, 0, 0, 0.4
+(UIColor *)ExtremeLightAlphaBlack;             // 0, 0, 0, 0.2
+(UIColor *)charcoalGrey;                       // 74, 74, 74
+(UIColor *)lightGrey;                          // 247, 247, 249
+(UIColor *)white;                              // 255, 255, 255
+(UIColor *)heavyAlphaWhite;                    // 255, 255, 255, 0.8
+(UIColor *)alphaWhite;                         // 255, 255, 255, 0.6
+(UIColor *)lightAlphaWhite;                    // 255, 255, 255, 0.4
+(UIColor *)purpleColor;                        // 128, 89, 229
+(UIColor *)lightPurpleColor;                   // 106, 67, 209
+(UIColor *)extremeLightHollywoodCeriseColor;   // 237, 0, 128, 0.05
+(UIColor *)hollywoodCeriseColor;               // 237, 0, 128

// for Text Color
+(UIColor *)mainTextColor;          // 0, 0, 0, 0.8
+(UIColor *)subTextColor;           // 0, 0, 0, 0.4
+(UIColor *)mainFrameColor;         // 106, 67, 209

@end

NS_ASSUME_NONNULL_END
