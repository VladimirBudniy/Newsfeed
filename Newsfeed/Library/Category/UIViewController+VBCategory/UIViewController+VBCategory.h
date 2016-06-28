//
//  UIViewController+VBCategory.h
//  IOSProject
//
//  Created by Vladimir Budniy on 22.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (VBCategory)
+ (instancetype)controllerFromNib;
+ (instancetype)controllerFromNibWithName:(NSString *)className;

@end
