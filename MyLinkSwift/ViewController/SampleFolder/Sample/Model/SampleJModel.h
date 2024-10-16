//
//  SampleJModel.h
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface SampleJModel : JSONModel

@property (nonatomic) NSInteger phone_number;
@property (nonatomic) NSString *address;

@end

NS_ASSUME_NONNULL_END
