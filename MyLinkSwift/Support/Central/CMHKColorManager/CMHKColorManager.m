//
//  CMHKColorManager.m
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 8/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import "CMHKColorManager.h"

@implementation CMHKColorManager

// Get color name : https://www.color-blindness.com/color-name-hue/

#pragma mark - Helper

+(UIColor *)colorHelperRGB:(CGFloat)rgb
{
    return [CMHKColorManager colorHelper:rgb withGreen:rgb withBlue:rgb withAlpha:1];
}

+(UIColor *)colorHelperRGB:(CGFloat)rgb withAlpha:(CGFloat)alpha;
{
    return [CMHKColorManager colorHelper:rgb withGreen:rgb withBlue:rgb withAlpha:alpha];
}

+(UIColor *)colorHelper:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue
{
    return [CMHKColorManager colorHelper:red withGreen:green withBlue:blue withAlpha:1];
}

+(UIColor *)colorHelper:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue withAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+(UIImage *)imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


#pragma mark - Public

+(UIColor *)clear
{
    return [UIColor clearColor];
}

+(UIColor *)black
{
    return [CMHKColorManager colorHelperRGB:0.0f];
}// 0, 0, 0

+(UIColor *)heavyAlphaBlack
{
    return [CMHKColorManager colorHelperRGB:0.0f withAlpha:0.8];
}// 0, 0, 0, 0.8

+(UIColor *)alphaBlack
{
    return [CMHKColorManager colorHelperRGB:0.0f withAlpha:0.6];
}// 0, 0, 0, 0.6

+(UIColor *)lightAlphaBlack
{
    return [CMHKColorManager colorHelperRGB:0.0f withAlpha:0.4];
}// 0, 0, 0, 0.4

+(UIColor *)ExtremeLightAlphaBlack
{
    return [CMHKColorManager colorHelperRGB:0.0f withAlpha:0.2];
}// 0, 0, 0, 0.2

+(UIColor *)charcoalGrey
{
    return [CMHKColorManager colorHelperRGB:74];
}// 74, 74, 74

+(UIColor *)lightGrey
{
    return [CMHKColorManager colorHelper:247.0f withGreen:247.0f withBlue:249.0f];
}// 247, 247, 249

+(UIColor *)white
{
    return [CMHKColorManager colorHelperRGB:255];
}// 255, 255, 255

+(UIColor *)heavyAlphaWhite
{
    return [CMHKColorManager colorHelperRGB:255 withAlpha:0.8];
}// 255, 255, 255, 0.8

+(UIColor *)alphaWhite
{
    return [CMHKColorManager colorHelperRGB:255 withAlpha:0.6];
}// 255, 255, 255, 0.6

+(UIColor *)lightAlphaWhite
{
    return [CMHKColorManager colorHelperRGB:255 withAlpha:0.4];
}// 255, 255, 255, 0.4

+(UIColor *)purpleColor
{
    return [CMHKColorManager colorHelper:128 withGreen:89 withBlue:229 withAlpha:1];
}// 128, 89, 229

+(UIColor *)lightPurpleColor
{
    return [CMHKColorManager colorHelper:106 withGreen:67 withBlue:209 withAlpha:1];
}// 106, 67, 209

+(UIColor *)extremeLightHollywoodCeriseColor
{
    return [CMHKColorManager colorHelper:237 withGreen:0 withBlue:128 withAlpha:0.05];
}// 237, 0, 128, 0.05

+(UIColor *)hollywoodCeriseColor
{
    return [CMHKColorManager colorHelper:237 withGreen:0 withBlue:128 withAlpha:1];
}// 237, 0, 128

#pragma mark - Text Color

+(UIColor *)mainTextColor
{
    return [CMHKColorManager heavyAlphaBlack];
}// 0, 0, 0, 0.8

+(UIColor *)subTextColor
{
    return [CMHKColorManager lightAlphaBlack];
}// 0, 0, 0, 0.4

+(UIColor *)mainFrameColor
{
    return [CMHKColorManager lightPurpleColor];
}// 106, 67, 209

@end
