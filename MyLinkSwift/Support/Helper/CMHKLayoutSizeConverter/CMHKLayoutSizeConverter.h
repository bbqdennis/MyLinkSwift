//
//  CMHKLayoutSizeConverter.h
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CMHKLayoutSizeConverter;

// Macros
#define CLS(float) [LayoutSizeConverter convertLayoutSize:(float)]
#define CLSX(float) [LayoutSizeConverter convertLayoutSizeX:(float)]
#define CLSInt(int) [LayoutSizeConverter convertLayoutSize:(int)]

@interface CMHKLayoutSizeConverter : NSObject

//Warning!! You need to call this function once first for init the screenScale value before using
+(void)startUp;

+(CGFloat)convertLayoutSize:(CGFloat)sizeValue;

/**
 Same as CLS but it is designed to use for CLS all vertical value,
 since we will handle the correct scale in iPhoneX also

 @param sizeValue the vertical value you need to rescale in new iPhone screen
 @return the corresponding scaled vertical value
 */
+(CGFloat)convertLayoutSizeX:(CGFloat)sizeValue;

+(CGFloat)returnScreenScale;
+(CGFloat)returnScreenScaleX;

+(CGSize)getSourceLayoutSize;

// scale CGFloat to SourceLayoutSize
+(CGFloat)getSourceLayoutFloat:(CGFloat)value;

// scale CGFloat from SourceLayoutSize to original size
+(CGFloat)getOriginalLayoutFloat:(CGFloat)value;

// scale frame to SourceLayoutSize
+(CGRect)getSourceLayoutFrame:(CGRect)aFrame;

// scale frame from SourceLayoutSize to original size
+(CGRect)getOriginalLayoutFrame:(CGRect)aFrame;

@end

NS_ASSUME_NONNULL_END
