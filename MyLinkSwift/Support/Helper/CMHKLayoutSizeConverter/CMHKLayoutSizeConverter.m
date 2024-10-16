//
//  CMHKLayoutSizeConverter.m
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import "CMHKLayoutSizeConverter.h"

// Helpers
#import "CMHKDeviceInfoHelper.h"

// Constants
#warning CD - you need to set back the base UI screen width
static CGFloat const kSourceLayoutWidth = 375.0f;
static CGFloat const kSourceLayoutHeight = 667.0f;

// Internal Variable
static CGFloat screenScale = 1.0f;
static CGFloat screenScaleX = 1.0f;

@implementation CMHKLayoutSizeConverter

#pragma mark - Helper

+(CGFloat)subConvertLayoutSize:(CGFloat)sizeValue withScale:(CGFloat)scale
{
    CGFloat newFloat = 0.0f;
    newFloat = sizeValue * scale;
    newFloat = ceilf(newFloat);
    //NSLog(@"CLS sizeValue %f newFloat %f", sizeValue, newFloat);
    return newFloat;
}


#pragma mark - Public

//Warning!! You need to call this function once first for init the screenScale value before using
+(void)startUp
{
    CGRect mainFrame = [[UIScreen mainScreen] bounds];
    screenScale = (mainFrame.size.width / kSourceLayoutWidth);
    screenScaleX = (mainFrame.size.height / kSourceLayoutHeight);
    NSLog(@"mainFrame %@", NSStringFromCGRect(mainFrame));
    NSLog(@"screenScale %f screenScaleX %f", screenScale, screenScaleX);
}

+(CGFloat)convertLayoutSize:(CGFloat)sizeValue
{
    return [CMHKLayoutSizeConverter subConvertLayoutSize:sizeValue withScale:screenScale];
}

+(CGFloat)convertLayoutSizeX:(CGFloat)sizeValue
{
    return [CMHKLayoutSizeConverter subConvertLayoutSize:sizeValue withScale:screenScaleX];
}

+(CGFloat)returnScreenScale
{
    NSLog(@"returnScreenScale %f", screenScale);
    return screenScale;
}

+(CGFloat)returnScreenScaleX
{
    NSLog(@"returnScreenScaleX %f", screenScaleX);
    return screenScaleX;
}

+(CGSize)getSourceLayoutSize
{
    return CGSizeMake(kSourceLayoutWidth, kSourceLayoutHeight);
}

// scale CGFloat to SourceLayoutSize
+(CGFloat)getSourceLayoutFloat:(CGFloat)value
{
    CGFloat newValue = value / screenScale;
    return newValue;
}

// scale CGFloat from SourceLayoutSize to original size
+(CGFloat)getOriginalLayoutFloat:(CGFloat)value
{
    CGFloat newValue = value * screenScale;
    return newValue;
}

// scale frame to SourceLayoutSize
+(CGRect)getSourceLayoutFrame:(CGRect)aFrame
{
    if (![CMHKDeviceInfoHelper isIPhoneX]) {
        
        aFrame.origin.x = aFrame.origin.x / screenScale;
        aFrame.origin.y = aFrame.origin.y / screenScaleX;
        aFrame.size.width = aFrame.size.width / screenScale;
        aFrame.size.height = aFrame.size.height / screenScaleX;
    }
    NSLog(@"getSourceLayoutFrame %@", NSStringFromCGRect(aFrame));
    return aFrame;
}

// scale frame from SourceLayoutSize to original size
+(CGRect)getOriginalLayoutFrame:(CGRect)aFrame
{
    if (![CMHKDeviceInfoHelper isIPhoneX]) {
        
        aFrame.origin.x = aFrame.origin.x * screenScale;
        aFrame.origin.y = aFrame.origin.y * screenScaleX;
        aFrame.size.width = aFrame.size.width * screenScale;
        aFrame.size.height = aFrame.size.height * screenScaleX;
    }
    NSLog(@"getOriginalLayoutFrame %@", NSStringFromCGRect(aFrame));
    return aFrame;
}

@end
