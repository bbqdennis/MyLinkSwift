//
//  CMHKFrameManager.h
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Macros
#define MAIN_SCREEN_BOUNDS [[UIScreen mainScreen] bounds]
#define MAIN_SCREEN_SIZE MAIN_SCREEN_BOUNDS.size

#define STATUS_BAR_HEIGHT [CMHKFrameManager getStatusBarHeight]
#define SEARCH_BAR_HEIGHT 56.0f

#define IPHONEX_TOP_M_HEIGHT 30.0f
#define IPHONEX_BOTTOM_LINE_HEIGHT 34.0f
#define NAVIGATION_BAR_HEIGHT 44.0f

#define TOP_BAR_HEIGHT [CMHKFrameManager getTopBarHeight]
#define TOP_BAR_FRAME CGRectMake(0.0f, 0.0f, MAIN_SCREEN_SIZE.width, TOP_BAR_HEIGHT)

#define BOTTOM_BAR_HEIGHT [CMHKFrameManager getBottomBarHeight]
#define BOTTOM_BAR_FRAME CGRectMake(0.0f, MAIN_SCREEN_SIZE.height - BOTTOM_BAR_HEIGHT, MAIN_SCREEN_SIZE.width, BOTTOM_BAR_HEIGHT)

// the frame which is excluding the top bar and bottom bar
#define VISIBLE_FRAME CGRectMake(0.0f, TOP_BAR_HEIGHT, MAIN_SCREEN_SIZE.width, MAIN_SCREEN_SIZE.height - TOP_BAR_HEIGHT - BOTTOM_BAR_HEIGHT)
#define VISIBLE_FRAME_ZERO CGRectMake(0.0f, 0.0f, MAIN_SCREEN_SIZE.width, MAIN_SCREEN_SIZE.height - BOTTOM_BAR_HEIGHT - TOP_BAR_HEIGHT)
#define VISIBLE_FRAME_TOPBAR CGRectMake(0.0f, TOP_BAR_HEIGHT, MAIN_SCREEN_SIZE.width, MAIN_SCREEN_SIZE.height - TOP_BAR_HEIGHT)
#define VISIBLE_FRAME_BOTTOM_BAR CGRectMake(0.0f, 0.0f, MAIN_SCREEN_SIZE.width, MAIN_SCREEN_SIZE.height - BOTTOM_BAR_HEIGHT)
#define VISIBLE_FRAME_TABLEVIEW CGRectMake(0.0f, 0.0f, MAIN_SCREEN_SIZE.width, MAIN_SCREEN_SIZE.height - TOP_BAR_HEIGHT)

@interface CMHKFrameManager : NSObject

+(CGRect)getMainScreenBounds;
+(CGSize)getMainScreenSize;

+(CGFloat)getStatusBarHeight;
+(CGFloat)getSearchBarHeight;

+(CGFloat)getIPhoneXTopMHeight;
+(CGFloat)getIPhoneBottomLineHeight;
+(CGFloat)getNavigationBarHeight;

+(CGFloat)getTopBarHeight;
+(CGRect)getTopBarFrame;

+(CGFloat)getBottomBarHeight;
+(CGRect)getBottomBarFrame;

+(CGFloat)getIPhoneXShiftBottomLineHeight;

+(CGRect)getVisibleFrame;
+(CGRect)getVisibleFrameZero;
+(CGRect)getVisibleFrameTopBar;
+(CGRect)getVisibleFrameBottomBar;
+(CGRect)getVisibleFrameTableView;

@end

NS_ASSUME_NONNULL_END
