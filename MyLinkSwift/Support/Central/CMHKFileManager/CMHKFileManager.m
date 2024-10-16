//
//  CMHKFileManager.m
//  csapp
//
//  Created by Dennis CHENG Kin Hang on 17/10/2019.
//  Copyright © 2019 CMHK. All rights reserved.
//

#import "CMHKFileManager.h"

// Macro
#define DOCSFOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"]
#warning CD - Must using back the real pdf domain
#define FileDomain @"http://www.mylink.com/pdf"

@interface CMHKFileManager ()

-(void)readyInit;

@end

@implementation CMHKFileManager

#pragma mark - Singleton

+ (instancetype)sharedManager {
    
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
}


#pragma mark - Helper

-(BOOL)checkDocFolder:(NSString *)filePath
{
    BOOL isExist = NO;
    NSString *pathname = [DOCSFOLDER stringByAppendingPathComponent:filePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:pathname]) {
        
        isExist = YES;
    }
    return isExist;
}


#pragma mark - Public

-(NSObject *)loadFromBundle:(NSString *)filePath isData:(BOOL)aBool
{
    printf("loadFromBundle %s isData %d\n", [filePath UTF8String], aBool);
    //for capture the filename first
    NSArray *array = [filePath componentsSeparatedByString:@"/"];
    NSString *filename = [array objectAtIndex:[array count]-1];
    
    //for loading for main bundle
    array = [filename componentsSeparatedByString:@"."];

    NSString *pathname = [[NSBundle mainBundle] pathForResource:[array objectAtIndex:0] ofType:[array objectAtIndex:1]];
    NSObject *object = nil;
    
    if (aBool) {
        
        object = [NSData dataWithContentsOfFile:pathname];
        
    } else {
        
        object = [NSString stringWithContentsOfFile:pathname encoding:NSUTF8StringEncoding error:nil];
    }
    return object;
}

-(NSObject *)loadFromDocFolder:(NSString *)filePath isData:(BOOL)aBool
{
    printf("loadFromDocFolder %s isData %d\n", [filePath UTF8String], aBool);
    NSString *pathname = [DOCSFOLDER stringByAppendingPathComponent:filePath];
    NSObject *object = nil;
    
    if (aBool) {
        
        object = [NSData dataWithContentsOfFile:pathname];
        
    } else {
        
        object = [NSString stringWithContentsOfFile:pathname encoding:NSUTF8StringEncoding error:nil];
    }
    return object;
}

-(NSObject *)loadFromServer:(NSString *)filePath isData:(BOOL)aBool
{
    NSString *urlLink = [FileDomain stringByAppendingPathComponent:filePath];
    return [self loadFromServerWithURLString:urlLink isData:aBool];
}

-(NSObject *)loadFromServerWithURLString:(NSString *)fileURLString isData:(BOOL)aBool withShouldAutoSave:(BOOL)shouldAutoSave
{
    printf("loadFromServerWithURLString %s isData %d\n", [fileURLString UTF8String], aBool);
    NSString *encodedURLString = [fileURLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:encodedURLString];
    NSObject *object = nil;
    NSData *data = nil;
    NSString *result = @"";
    BOOL isSuccess = NO;
    
    if (aBool) {
        
        data = [NSData dataWithContentsOfURL:url];
        
        if (data.length > 0) {
            
            isSuccess = YES;
            object = data;
        }
    } else {
        
        result = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        
        if (result.length > 0) {
            
            isSuccess = YES;
            object = result;
        }
    }
    return object;
}

-(void)saveToDocFolder:(NSObject *)object withPath:(NSString *)filePath isData:(BOOL)aBool
{
    //for capture the folder path
    NSString *folderPath = @"";
    NSArray *array = [filePath componentsSeparatedByString:@"/"];
    
    if ([array count]>1) {
        
        for (int i=0; i<[array count]-1; i++) {
            
            folderPath = [folderPath stringByAppendingPathComponent:[array objectAtIndex:i]];
            folderPath = [DOCSFOLDER stringByAppendingPathComponent:folderPath];
        }
    }
    
    NSString *pathname = [DOCSFOLDER stringByAppendingPathComponent:filePath];
    
    if ([array count]>1) {
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:pathname]) {
            
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:NULL];
        }
    }
    
    if (aBool) {
        
        NSData *data = (NSData *)object;
        [data writeToFile:pathname atomically:YES];
        
    } else {
        
        NSString *result = (NSString *)object;
        [result writeToFile:pathname atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

@end
