//
//  UIView+EasyFrame.h
//  MyLink
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 Dennis. All rights reserved.
//

#import "UIView+EasyFrame.h"

@implementation UIView (EasyFrame)

#pragma mark - Getter

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)minX
{
    return self.frame.origin.x;
}

- (CGFloat)midX
{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)minY
{
    return self.frame.origin.y;
}

- (CGFloat)midY
{
    return CGRectGetMidY(self.frame);
}

- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)minWidth
{
    return self.frame.size.width;
}

- (CGFloat)maxWidth
{
    return self.frame.size.width;
}

- (CGFloat)minHeight
{
    return self.frame.size.height;
}

- (CGFloat)maxHeight
{
    return self.frame.size.height;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGSize)size
{
    return self.frame.size;
}

// for negative direction

- (CGFloat)minRX
{
    return (self.superview.width - self.maxX);
}

- (CGFloat)midRX
{
    return (self.superview.width - self.midX);
}

- (CGFloat)maxRX
{
    return (self.superview.width - self.minX);
}

- (CGFloat)minRY
{
    return (self.superview.height - self.maxY);
}

- (CGFloat)midRY
{
    return (self.superview.height - self.midY);
}

- (CGFloat)maxRY
{
    return (self.superview.height - self.minY);
}

- (CGFloat)minRWidth
{
    return self.frame.size.width;
}

- (CGFloat)maxRWidth
{
    return self.frame.size.width;
}

- (CGFloat)minRHeight
{
    return self.frame.size.height;
}

- (CGFloat)maxRHeight
{
    return self.frame.size.height;
}

- (CGPoint)originRX
{
    return CGPointMake(self.minRX, self.minY);
}

- (CGPoint)originRY
{
    return CGPointMake(self.minX, self.minRY);
}

- (CGPoint)originRXY
{
    return CGPointMake(self.minRX, self.minRY);
}

- (CGPoint)centerRX
{
    return CGPointMake(self.midRX, self.midY);
}

- (CGPoint)centerRY
{
    return CGPointMake(self.midX, self.midRY);
}

- (CGPoint)centerRXY
{
    return CGPointMake(self.midRX, self.midRY);
}

- (CGRect)frameRX
{
    return CGRectMake(self.minRX, self.minY, self.width, self.height);
}

- (CGRect)frameRY
{
    return CGRectMake(self.minX, self.minRY, self.width, self.height);
}

- (CGRect)frameRXY
{
    return CGRectMake(self.minRX, self.minRY, self.width, self.height);
}


#pragma mark - Setter

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setMinX:(CGFloat)minX
{
    CGRect frame = self.frame;
    frame.origin.x = minX;
    self.frame = frame;
}

- (void)setMidX:(CGFloat)midX
{
    self.minX = midX - self.width/2;
}

- (void)setMaxX:(CGFloat)maxX
{
    self.minX = maxX - self.width;
}

- (void)setMinY:(CGFloat)minY
{
    CGRect frame = self.frame;
    frame.origin.y = minY;
    self.frame = frame;
}

- (void)setMidY:(CGFloat)midY
{
    self.minY = midY - self.height/2;
}

- (void)setMaxY:(CGFloat)maxY
{
    self.minY = maxY - self.height;
}

- (void)setMinWidth:(CGFloat)minWidth
{
    self.width = self.maxX - minWidth;
    self.minX = minWidth;
}

- (void)setMaxWidth:(CGFloat)maxWidth
{
    self.width = maxWidth - self.minX;
}

- (void)setMinHeight:(CGFloat)minHeight
{
    self.height = self.maxY - minHeight;
    self.minY = minHeight;
}

- (void)setMaxHeight:(CGFloat)maxHeight
{
    self.height = maxHeight - self.minY;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

// for negative direction

- (void)setMinRX:(CGFloat)minRX
{
    self.minX = self.superview.width - minRX - self.width;
}

- (void)setMidRX:(CGFloat)midRX
{
    self.minX = self.superview.width - midRX - self.width/2;
}

- (void)setMaxRX:(CGFloat)maxRX
{
    self.minX = self.superview.width - maxRX;
}

- (void)setMinRY:(CGFloat)minRY
{
    self.minY = self.superview.height - minRY - self.height;
}

- (void)setMidRY:(CGFloat)midRY
{
    self.minY = self.superview.height - midRY - self.height/2;
}

- (void)setMaxRY:(CGFloat)maxRY
{
    self.minY = self.superview.height - maxRY;
}

- (void)setMinRWidth:(CGFloat)minRWidth
{
    self.width = self.superview.width - self.minX - minRWidth;
}

- (void)setMaxRWidth:(CGFloat)maxRWidth
{
    self.width = maxRWidth - self.minRX;
    self.maxRX = maxRWidth;
}

- (void)setMinRHeight:(CGFloat)minRHeight
{
    self.height = self.superview.height - self.minY - minRHeight;
}

- (void)setMaxRHeight:(CGFloat)maxRHeight
{
    self.height = maxRHeight - self.minRY;
    self.maxRY = maxRHeight;
}

- (void)setOriginRX:(CGPoint)originRX
{
    self.minRX = originRX.x;
    self.minY = originRX.y;
}

- (void)setOriginRY:(CGPoint)originRY
{
    self.minX = originRY.x;
    self.minRY = originRY.y;
}

- (void)setOriginRXY:(CGPoint)originRXY
{
    self.minRX = originRXY.x;
    self.minRY = originRXY.y;
}

- (void)setCenterRX:(CGPoint)centerRX
{
    self.midRX = centerRX.x;
    self.midY = centerRX.y;
}

- (void)setCenterRY:(CGPoint)centerRY
{
    self.midX = centerRY.x;
    self.midRY = centerRY.y;
}

- (void)setCenterRXY:(CGPoint)centerRXY
{
    self.midRX = centerRXY.x;
    self.midRY = centerRXY.y;
}

- (void)setFrameRX:(CGRect)frameRX
{
    self.size = frameRX.size;
    self.originRX = frameRX.origin;
}

- (void)setFrameRY:(CGRect)frameRY
{
    self.size = frameRY.size;
    self.originRY = frameRY.origin;
}

- (void)setFrameRXY:(CGRect)frameRXY
{
    self.size = frameRXY.size;
    self.originRXY = frameRXY.origin;
}


#pragma mark - Helper



#pragma mark - Common

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeFromSuperview];
}


#pragma mark - Public

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (UIImage *)getViewImageWithViewSize:(BOOL)isViewSize
{
    UIGraphicsBeginImageContextWithOptions(isViewSize?self.bounds.size:[[UIScreen mainScreen] bounds].size, NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)removeSubviews
{
    for (UIView *tmpView in self.subviews) {
        
        [tmpView removeFromSuperview];
    }
}

- (void)setSubviewsHidden:(BOOL)hidden
{
    for (UIView *view in self.subviews) {
        
        [view setHidden:hidden];
    }
}

- (void)addToSuperView:(UIView *)superView
{
    [superView addSubview:self];
}

- (void)addToSuperViewWithFadeAnimation:(UIView *)superView duration:(NSTimeInterval)duration alpha:(CGFloat)ap
{
    [self addToSuperView:superView];
    [self setAlpha:0];
    [UIView beginAnimations:@"alpha_in_ani" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:duration];
    [self setAlpha:ap];
    [UIView commitAnimations];
}

- (void)removeFromSuperViewWithFadeAnimationDuration:(NSTimeInterval)duration
{
    [UIView beginAnimations:@"alpha_out_ani" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    [self setAlpha:0];
    [UIView commitAnimations];
}

- (void)removeAllGestureRecognizer
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        
        [self removeGestureRecognizer:gesture];
    }
}

@end
