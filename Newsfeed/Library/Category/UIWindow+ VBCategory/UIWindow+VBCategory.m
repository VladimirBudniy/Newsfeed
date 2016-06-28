//
//  UIWindow+VBCategory.m
//  IOSProject
//
//  Created by Vladimir Budniy on 04.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "UIWindow+VBCategory.h"

@implementation UIWindow (VBCategory)

+ (UIWindow *)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
