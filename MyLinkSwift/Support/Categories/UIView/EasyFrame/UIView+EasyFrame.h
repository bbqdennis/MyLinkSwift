//
//  UIView+EasyFrame.h
//  MyLink
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EasyFrame)

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat minX;
@property (nonatomic) CGFloat midX;
@property (nonatomic) CGFloat maxX;

@property (nonatomic) CGFloat minY;
@property (nonatomic) CGFloat midY;
@property (nonatomic) CGFloat maxY;

// for extend the width from right side to left side to specific origin x
@property (nonatomic) CGFloat minWidth;

// for extend the width from left side to right side to specific origin x
@property (nonatomic) CGFloat maxWidth;

// for extend the height from bottom side to top side to specific origin y
@property (nonatomic) CGFloat minHeight;

// for extend the height from top side to bottom side to specific origin y
@property (nonatomic) CGFloat maxHeight;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

// for negative direction
@property (nonatomic) CGFloat minRX;
@property (nonatomic) CGFloat midRX;
@property (nonatomic) CGFloat maxRX;

@property (nonatomic) CGFloat minRY;
@property (nonatomic) CGFloat midRY;
@property (nonatomic) CGFloat maxRY;

// for extend the width from left side to right side to specific origin rx
@property (nonatomic) CGFloat minRWidth;

// for extend the width from right side to left side to specific origin rx
@property (nonatomic) CGFloat maxRWidth;

// for extend the height from top side to bottom side to specific origin ry
@property (nonatomic) CGFloat minRHeight;

// for extend the height from bottom side to top side to specific origin ry
@property (nonatomic) CGFloat maxRHeight;

@property (nonatomic) CGPoint originRX;
@property (nonatomic) CGPoint originRY;
@property (nonatomic) CGPoint originRXY;

@property (nonatomic) CGPoint centerRX;
@property (nonatomic) CGPoint centerRY;
@property (nonatomic) CGPoint centerRXY;

@property (nonatomic) CGRect frameRX;
@property (nonatomic) CGRect frameRY;
@property (nonatomic) CGRect frameRXY;


- (UIViewController *)viewController;
- (UIImage *)getViewImageWithViewSize:(BOOL)isViewSize;

- (void)removeSubviews;
- (void)setSubviewsHidden:(BOOL)hidden;

- (void)addToSuperView:(UIView *)superView;
- (void)addToSuperViewWithFadeAnimation:(UIView *)superView duration:(NSTimeInterval)duration alpha:(CGFloat)ap;
- (void)removeFromSuperViewWithFadeAnimationDuration:(NSTimeInterval)duration;

- (void)removeAllGestureRecognizer;

@end
