//
//  UIView+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 28.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIView+VBCategory.h"

#define VBCustormSnowWhiteColor [UIColor colorWithRed:255 green:250 blue:250 alpha:0.8]
#define VBCustormBlackColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]

static CGFloat  const kVBDefaultCornerRadius        = 15;
static CGFloat  const kVBDefaultBorderWidths        = 1;

@implementation UIView (VBCategory)

- (void)roundCornersWhiteColorFrame {
    [self roundCornerRadius:kVBDefaultCornerRadius
                borderColor:VBCustormSnowWhiteColor
                borderWidth:kVBDefaultBorderWidths];
}

- (void)roundCornersBlackColorFrame {
    [self roundCornerRadius:kVBDefaultCornerRadius
                borderColor:VBCustormBlackColor
                borderWidth:kVBDefaultBorderWidths];
}

- (void)roundCornerRadius:(CGFloat)cornerRadius
              borderColor:(UIColor *)color
              borderWidth:(CGFloat)borderWidth
{
    CALayer *layer = self.layer;
    layer.masksToBounds = YES;
    layer.cornerRadius = cornerRadius;
    layer.borderWidth = borderWidth;
    layer.borderColor = [color CGColor];
}

- (void)roundCorners:(CGFloat)cornerRadius {
    CALayer *layer = self.layer;
    UIColor *color = [UIColor colorWithCGColor:layer.borderColor];
    [self roundCornerRadius:cornerRadius
                borderColor:color
                borderWidth:layer.borderWidth];
}

- (void)adjustBorderWidth:(CGFloat)borderWidth {
    CALayer *layer = self.layer;
    UIColor *color = [UIColor colorWithCGColor:layer.borderColor];
    [self roundCornerRadius:layer.cornerRadius
                borderColor:color
                borderWidth:borderWidth];
}

- (void)setBorderByColor:(UIColor *)color {
    CALayer *layer = self.layer;
    [self roundCornerRadius:layer.cornerRadius
                borderColor:color
                borderWidth:layer.borderWidth];
}

@end
