//
//  CMHKFileManager.h
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 17/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMHKFileManager : NSObject

+ (instancetype)sharedManager;

/// Loading any file from the NSBundle
/// @param filePath passing the filename @"mylink.pdf" directly or with folder path also supported @"MyLink/mylink.pdf"
/// @param aBool YES for NSData return, NO for NSString return
-(NSObject *)loadFromBundle:(NSString *)filePath isData:(BOOL)aBool;

/// Loading any file from the app document folder - [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]
/// @param filePath passing the filename @"mylink.pdf" directly or with folder path also supported @"MyLink/mylink.pdf"
/// @param aBool YES for NSData return, NO for NSString return
-(NSObject *)loadFromDocFolder:(NSString *)filePath isData:(BOOL)aBool;

/// Loading any file from the file server folder - @"http://www.mylink.com/pdf"
/// @param filePath passing the filename @"mylink.pdf" directly or with folder path also supported @"MyLink/mylink.pdf"
/// @param aBool YES for NSData return, NO for NSString return
-(NSObject *)loadFromServer:(NSString *)filePath isData:(BOOL)aBool;

/// Loading any file from the file url string directly
/// @param fileURLString passing the filename @"mylink.pdf" directly or with folder path also supported @"MyLink/mylink.pdf"
/// @param aBool YES for NSData return, NO for NSString return
-(NSObject *)loadFromServerWithURLString:(NSString *)fileURLString isData:(BOOL)aBool;


/// Saving any file to the app document folder - [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]
/// @param object can be NSString or NSData, it is according to the aBool
/// @param filePath passing the filename @"mylink.pdf" directly or with folder path also supported @"MyLink/mylink.pdf"
/// @param aBool YES for NSData return, NO for NSString return
-(void)saveToDocFolder:(NSObject *)object withPath:(NSString *)filePath isData:(BOOL)aBool;

@end

NS_ASSUME_NONNULL_END
