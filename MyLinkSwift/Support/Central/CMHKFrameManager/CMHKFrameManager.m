//
//  CMHKFrameManager.m
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import "CMHKFrameManager.h"

// Helper
#import "CMHKDeviceInfoHelper.h"

@implementation CMHKFrameManager

#pragma mark - Public

+(CGRect)getMainScreenBounds {
    
    return MAIN_SCREEN_BOUNDS;
}

+(CGSize)getMainScreenSize {
    
    return MAIN_SCREEN_SIZE;
}

+(CGFloat)getStatusBarHeight {
    
    return STATUS_BAR_HEIGHT;
}

+(CGFloat)getSearchBarHeight {
    
    return SEARCH_BAR_HEIGHT;
}

+(CGFloat)getIPhoneXTopMHeight {
    
    return IPHONEX_TOP_M_HEIGHT;
}

+(CGFloat)getIPhoneBottomLineHeight {
    
    return IPHONEX_BOTTOM_LINE_HEIGHT;
}

+(CGFloat)getNavigationBarHeight {
    
    return NAVIGATION_BAR_HEIGHT;
}

+(CGFloat)getTopBarHeight {
    
    return TOP_BAR_HEIGHT;
}

+(CGRect)getTopBarFrame {
    
    return TOP_BAR_FRAME;
}

+(CGFloat)getBottomBarHeight {
    
    return BOTTOM_BAR_HEIGHT;
}

+(CGRect)getBottomBarFrame {
    
    return BOTTOM_BAR_FRAME;
}

+(CGFloat)getIPhoneXShiftBottomLineHeight {
    
    return [CMHKDeviceInfoHelper isIPhoneX] ? IPHONEX_BOTTOM_LINE_HEIGHT : 0.0f;
}

+(CGRect)getVisibleFrame {
    
    return VISIBLE_FRAME;
}

+(CGRect)getVisibleFrameZero {
    
    return VISIBLE_FRAME_ZERO;
}

+(CGRect)getVisibleFrameTopBar {
    
    return VISIBLE_FRAME_TOPBAR;
}

+(CGRect)getVisibleFrameBottomBar {
    
    return VISIBLE_FRAME_BOTTOM_BAR;
}

+(CGRect)getVisibleFrameTableView {
    
    return VISIBLE_FRAME_TABLEVIEW;
}

@end
