//
//  UIView+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 28.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VBCategory)

- (void)roundCornersWhiteColorFrame;
- (void)roundCornersBlackColorFrame;

- (void)roundCornerRadius:(CGFloat)cornerRadius
               borderColor:(UIColor *)color
               borderWidth:(CGFloat)borderWidth;

- (void)roundCorners:(CGFloat)cornersRadius;
- (void)adjustBorderWidth:(CGFloat)borderWidth;
- (void)setBorderByColor:(UIColor *)color;

@end
