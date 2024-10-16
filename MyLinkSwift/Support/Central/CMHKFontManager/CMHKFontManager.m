//
//  CMHKFontManager.m
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 9/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import "CMHKFontManager.h"

@implementation CMHKFontManager

#pragma mark - Public

// for Bold
+(UIFont *)boldMainNavTitleFont {
    
    return BoldMainNavTitleFont;
}

// for Middle
+(UIFont *)middleMainTextFont {
    
    return MiddleMainTextFont;
}

+(UIFont *)middleSubTextFont {
    
    return MiddleSubTextFont;
}

// for Normal
+(UIFont *)normalMainTextFont {
    
    return NormalMainTextFont;
}

+(UIFont *)normalSubTextFont {
    
    return NormalSubTextFont;
}

+(UIFont *)normalMainNavButtonFont {
    
    return NormalMainNavButtonFont;
}

@end
